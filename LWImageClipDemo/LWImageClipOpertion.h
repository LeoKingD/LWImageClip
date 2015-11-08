//
//  LWImageClipOpertion.h
//  LWImageClipDemo
//
//  Created by leo on 15/9/29.
//  Copyright © 2015年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^LWImageClipOpertionCompletionBlock)(UIImage *image, NSString *imageKey);

@interface LWImageClipOpertion : NSOperation

@property (nonatomic, copy, readonly)   NSString *imageKey;

- (void)completionWithImage:(UIImage *)image;

- (id)initWithImage:(UIImage *)sourceImage imageKey:(NSString *)imageKey completion:(LWImageClipOpertionCompletionBlock)completion;

@end
