//
//  LWImageManager.m
//  LWImageClipDemo
//
//  Created by leo on 15/9/28.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "LWImageManager.h"

@interface LWImageManager ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSMutableDictionary *clipImageCache;

@end

@implementation LWImageManager

+ (id)shareImageManager
{
    static dispatch_once_t onceToken;
    static LWImageManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount = 6;
        self.clipImageCache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)storeImage:(UIImage *)image WithImageKey:(NSString *)imageKey
{
    if (imageKey && imageKey)
    {
        [self.clipImageCache setObject:image forKey:imageKey];
    }
}

- (void)startClipImageWithOpertion:(LWImageClipOpertion *)operation
{
    if (operation.imageKey)
    {
        UIImage *cacheImage = [self.clipImageCache objectForKey:operation.imageKey];
        
        if (cacheImage)
        {
            [operation completionWithImage:cacheImage];
        } else
        {
            [self.queue addOperation:operation];
        }
    } else
    {
        [self.queue addOperation:operation];
    }
}

@end
