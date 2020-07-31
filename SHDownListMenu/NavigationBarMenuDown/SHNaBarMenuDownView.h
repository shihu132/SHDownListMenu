
//
//  SHNaBarMenuDownView.h
// 
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SHNaBarMenuDownListView;
@interface SHNaBarMenuDownView : UIView


/// 公共科目切换
/// @param frame 默认先CGRectZero
/// @param array 展示列表数据
/// @param title 主标题
/// @param classView 添加视图
/// @param callBlock 处理点击回调事件
- (id)initWithFrame:(CGRect)frame
              array:(NSArray *)array
              title:(NSString *)title
          classView:(UIView *)classView
          callBlock:(void(^)(NSInteger index))callBlock;
/**
  主标题颜色 -默认主界面颜色
*/
@property (nonatomic) UIColor *titelButtonBgColor;
/**
  主标题字体颜色 -默认白色
*/
@property (nonatomic) UIColor *titelButtonFontColor;
/**
  主标题字体 -默认 18
*/
@property (nonatomic) CGFloat  titelButtonFont;
@property (nonatomic) UIFont *titleButtFont;
/**
  主标题小箭头 -
*/
@property (nonatomic) UIImage  *titelButtonImage;
@property (nonatomic, strong) SHNaBarMenuDownListView *menuDownListView;
@end

NS_ASSUME_NONNULL_END

