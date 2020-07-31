//
//  SHNaBarMenuDownListView.h
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DismissBlock)();
@class SHUIButton;
NS_ASSUME_NONNULL_BEGIN
@protocol MenuDownListViewDelegate <NSObject>
/**
 *  代理
 */
- (void)dropDownListParame:(NSString *)titelString clickIndex:(NSInteger)clickIndex;

@end

@interface SHNaBarMenuDownListView : UIView
/**
 *  设置代理
 */
@property(nonatomic,assign)id<MenuDownListViewDelegate>delegate;
/**
*  点击空白处消失
*/
@property (nonatomic, copy) DismissBlock dismissBlock;
/**
  内容字体颜色 -默认黑色
*/
@property (nonatomic) UIColor *titelListFontColor;
/**
  内容字体 -默认 16
*/
@property (nonatomic) CGFloat  titelListFont;
/**
 *   显示下拉列表
 */
- (void)showList;
/**
 *   隐藏
 */
- (void)hiddenList;
/**
 * array :展示列表
 * menuButton : 把当前点击按钮传过来
 */
- (id)initWithListDataSource:(NSArray *)array
                  menuButton:(SHUIButton *)menuButton;

@end

NS_ASSUME_NONNULL_END
