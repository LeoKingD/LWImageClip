//
//  LWImageClipOpertion.m
//  LWImageClipDemo
//
//  Created by leo on 15/9/29.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "LWImageClipOpertion.h"

@interface LWImageClipOpertion ()

@property (nonatomic, strong) UIImage *sourceImage;
@property (nonatomic, copy)   NSString *imageKey;
@property (nonatomic, strong) LWImageClipOpertionCompletionBlock completion;

@end

@implementation LWImageClipOpertion

- (id)initWithImage:(UIImage *)sourceImage imageKey:(NSString *)imageKey completion:(LWImageClipOpertionCompletionBlock)completion
{
    self = [super init];
    if (self) {
        self.sourceImage = sourceImage;
        self.imageKey   = imageKey;
        self.completion = completion;
    }
    
    return self;
}

- (void)main
{
    CFTimeInterval start = CACurrentMediaTime();
    

    CGSize size = CGSizeMake(200, 200);
    CGRect rect = (CGRect){.origin = {0, 0}, .size = size};
    
    if (self.cancelled)
    {
        NSLog(@"cancelled 1");
        return;
    }
    
    UIGraphicsBeginImageContext(size);
    UIGraphicsGetCurrentContext();
    
    if (self.cancelled)
    {
        NSLog(@"cancelled 2");
        return;
    }
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:size.width/2.0] addClip];
    [self.sourceImage drawInRect:rect];
    
    if (self.cancelled)
    {
        NSLog(@"cancelled 3");
        return;
    }
    
    UIImage *resoultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    if (self.cancelled)
    {
        NSLog(@"cancelled 4");
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.completion && resoultImage)
        {
            self.completion(resoultImage, self.imageKey);
        }
    });
    
    CFTimeInterval end = CACurrentMediaTime();
    
    NSLog(@"speed time = %f", end - start);
}

- (void)completionWithImage:(UIImage *)image
{
    self.completion(image, self.imageKey);
}

@end
