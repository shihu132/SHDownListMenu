//
//  SHNaBarMenuDownCell.h
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHNaBarMenuDownCell : UITableViewCell
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
  内容字体颜色 -默认黑色
*/
@property (nonatomic) UIColor *titelCellFontColor;
/**
  内容字体 -默认 16
*/
@property (nonatomic) CGFloat  titelCellFont;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
