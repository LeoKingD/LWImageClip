//
//  UIImageView+LWClip.m
//  LWImageClipDemo
//
//  Created by leo on 15/9/29.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "UIImageView+LWClip.h"
#import "LWImageManager.h"
#import <objc/runtime.h>

@interface UIImageView ()

@property (nonatomic, copy)   NSString *imageKey;
@property (nonatomic, strong) NSMutableDictionary *opertionDictionary;

@end

@implementation UIImageView (LWClip)

static char LW_ImageKey;
static char LW_OperationDicKey;

- (void)setImageKey:(NSString *)imageKey
{
    objc_setAssociatedObject(self, &LW_ImageKey, imageKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)imageKey
{
    return objc_getAssociatedObject(self, &LW_ImageKey);
}

- (void)setOpertionDictionary:(NSMutableDictionary *)opertionDictionary
{
    objc_setAssociatedObject(self, &LW_OperationDicKey, opertionDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)opertionDictionary
{
    NSMutableDictionary *opetionDic = objc_getAssociatedObject(self, &LW_OperationDicKey);
    
    if (!opetionDic)
    {
        opetionDic = [[NSMutableDictionary alloc] init];
        self.opertionDictionary = opetionDic;
    }
    
    return opetionDic;
}

- (void)setImage:(UIImage *)image withImageKey:(NSString *)imageKey
{
    if (image && imageKey)
    {
        LWImageClipOpertion *operation = self.opertionDictionary[imageKey];
        
        if (operation)
        {
            [operation cancel];
        }
        
        self.imageKey = imageKey;
        
        __weak UIImageView *wSelf = self;
        operation = [[LWImageClipOpertion alloc] initWithImage:image imageKey:imageKey completion:^(UIImage *image, NSString *imageKey) {
            wSelf.image = image;
            [[LWImageManager shareImageManager] storeImage:image WithImageKey:imageKey];
        }];
        
        [[LWImageManager shareImageManager] startClipImageWithOpertion:operation];
        [self.opertionDictionary setObject:operation forKey:imageKey];
    }
}

@end
