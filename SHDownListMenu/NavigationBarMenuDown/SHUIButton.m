//
//  SHUIButton.m
//
//  Created by 石虎 on 2020/7/12.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHUIButton.h"
#import "UIView+Frame.h"

@implementation SHUIButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //得到imageView和titleLabel的宽、高
    CGFloat imageWidth  = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    CGFloat lableWidth  = self.titleLabel.intrinsicContentSize.width;
    CGFloat lableHeight = self.titleLabel.intrinsicContentSize.height;
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    CGFloat space = 5.0;
    self.titleLabel.tz_centerX = self.tz_centerX - (imageWidth + space)/2;
    self.imageView.tz_left     = self.titleLabel.tz_right + space;
    /**
    //重写 Titel
    CGRect titleLabelFrame   = self.titleLabel.frame;
    titleLabelFrame.origin.x = 0;
    self.titleLabel.frame    = titleLabelFrame;

    //重写 image
    CGRect imageViewFrame   = self.imageView.frame;
    imageViewFrame.origin.x = 0;
    self.imageView.frame    = imageViewFrame;   
    */
}

@end
