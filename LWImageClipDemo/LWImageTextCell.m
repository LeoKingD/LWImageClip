//
//  LWImageTextCell.m
//  LWImageClipDemo
//
//  Created by leo on 15/9/29.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "LWImageTextCell.h"
#import "UIImageView+LWClip.h"

@implementation LWImageTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.image1 = [[UIImageView alloc] init];
        self.image1.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.image1];
        
        self.image2 = [[UIImageView alloc] init];
        self.image2.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.image2];
        
//        self.image3 = [[UIImageView alloc] init];
//        self.image3.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.contentView addSubview:self.image3];
        
//        self.image4 = [[UIImageView alloc] init];
//        self.image4.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.contentView addSubview:self.image4];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_image1]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_image1)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_image2]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_image2)]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_image3]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_image3)]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_image4]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_image4)]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.image1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.image1 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_image1(_image1)][_image2(_image1)][_image3(_image1)][_image4(_image1)]" options:NSLayoutFormatAlignAllCenterY metrics:0 views:NSDictionaryOfVariableBindings(_image1, _image2, _image3, _image4)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_image1(_image1)][_image2(_image1)]" options:NSLayoutFormatAlignAllCenterY metrics:0 views:NSDictionaryOfVariableBindings(_image1, _image2)]];
    }
    
    return self;
}

- (void)reloadWithImageName:(NSString *)imageName
{
    [self.image1 setImage:[UIImage imageNamed:imageName] withImageKey:imageName];
    [self.image2 setImage:[UIImage imageNamed:imageName] withImageKey:imageName];
//    [self.image3 setImage:[UIImage imageNamed:imageName] withImageKey:imageName];
//    [self.image4 setImage:[UIImage imageNamed:imageName] withImageKey:imageName];
    
}

@end
