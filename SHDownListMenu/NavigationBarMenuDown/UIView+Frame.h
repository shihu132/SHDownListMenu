//
//  UIView+Frame.h
//  SHDownListMenu
//
//  Created by 石虎 on 2020/7/18.
//  Copyright © 2020 cdel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)
// 如果@property在声明类的时候使用,那么@property会自动生成属性,分类里面不能添加属性
// 如果@property在分类中使用,不会生成成员属性,只会生成get,set方法声明

@property (nonatomic) CGFloat tz_left;        ///<  for frame.origin.x.
@property (nonatomic) CGFloat tz_top;         ///<  for frame.origin.y
@property (nonatomic) CGFloat tz_right;       ///<  for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat tz_bottom;      ///<  for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat tz_width;       ///<  for frame.size.width.
@property (nonatomic) CGFloat tz_height;      ///<  for frame.size.height.
@property (nonatomic) CGFloat tz_centerX;     ///<  for center.x
@property (nonatomic) CGFloat tz_centerY;     ///<  for center.y
@property (nonatomic) CGPoint tz_origin;      ///<  for frame.origin.
@property (nonatomic) CGSize  tz_size;        ///<  for frame.size.

@end

NS_ASSUME_NONNULL_END
