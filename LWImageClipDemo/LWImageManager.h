//
//  LWImageManager.h
//  LWImageClipDemo
//
//  Created by leo on 15/9/28.
//  Copyright © 2015年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWImageClipOpertion.h"
#import <UIKit/UIKit.h>

@interface LWImageManager : NSObject

+ (id)shareImageManager;

- (void)storeImage:(UIImage *)image WithImageKey:(NSString *)imageKey;

- (void)startClipImageWithOpertion:(LWImageClipOpertion *)operation;

@end
