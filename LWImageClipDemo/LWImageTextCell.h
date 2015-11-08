//
//  LWImageTextCell.h
//  LWImageClipDemo
//
//  Created by leo on 15/9/29.
//  Copyright © 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWImageTextCell : UITableViewCell

@property (strong, nonatomic) UIImageView *image1;
@property (strong, nonatomic) UIImageView *image2;
@property (strong, nonatomic) UIImageView *image3;
@property (strong, nonatomic) UIImageView *image4;

- (void)reloadWithImageName:(NSString *)imageName;

@end
