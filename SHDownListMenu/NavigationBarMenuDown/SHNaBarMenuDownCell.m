//
//  SHNaBarMenuDownCell.m
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHNaBarMenuDownCell.h"
#import "UIView+Frame.h"

@interface SHNaBarMenuDownCell ()
/** 分割线 */
@property (nonatomic, strong) UIView  *lineView;
@end

@implementation SHNaBarMenuDownCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * cellId = @"SHNaBarMenuDownCell";
    SHNaBarMenuDownCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if (!cell) {
        cell = [[SHNaBarMenuDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
        [self setupLayouts];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.lineView];
}

- (void)setupLayouts {

    /**
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(20);
        make.right.equalTo(-20);
        make.height.equalTo(22);
        make.centerY.equalTo(self.centerY);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.height.equalTo(1./[UIScreen mainScreen].scale);
        make.bottom.equalTo(self.contentView.bottom).offset(- (1./[UIScreen mainScreen].scale));
    }];
   */
    
    self.titleLabel.frame = CGRectMake(20, 0,[[UIScreen mainScreen] bounds].size.width-20*2, 22);
    self.titleLabel.tz_centerY = self.tz_centerY;
    self.lineView.frame = CGRectMake(0, self.tz_bottom- (1./[UIScreen mainScreen].scale),[[UIScreen mainScreen] bounds].size.width,1./[UIScreen mainScreen].scale);
    self.lineView.tz_centerY = self.tz_centerY;
}

#pragma mark - lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel                 = [[UILabel alloc] init];
//        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font            = [UIFont systemFontOfSize:16.0];
        _titleLabel.textAlignment   = NSTextAlignmentCenter;
        _titleLabel.textColor       = [UIColor colorWithRed:34/255 green:34/255 blue:34/255 alpha:1];
        _titleLabel.numberOfLines   = 1;
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView                   = [[UIView alloc] init];
        _lineView.layer.borderColor = [[UIColor colorWithRed:238.0f/255.0f green:238.0f/255.0f blue:238.0f/255.0f alpha:1.0f] CGColor];
        _lineView.layer.borderWidth = 1;
        _lineView.alpha = 1;
    }
    return _lineView;
}

#pragma mark -
#pragma mark - Setter Method
- (void)setTitelCellFontColor:(UIColor *)titelCellFontColor {
    _titelCellFontColor = titelCellFontColor;
    if (titelCellFontColor) {
        _titleLabel.textColor = titelCellFontColor;
    } else {
        _titleLabel.textColor = [UIColor colorWithRed:34/255 green:34/255 blue:34/255 alpha:1];
    }
}
- (void)setTitelCellFont:(CGFloat)titelCellFont {
    _titelCellFont = titelCellFont;
    if (titelCellFont == 0) {
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
    } else {
        _titleLabel.font = [UIFont systemFontOfSize:titelCellFont];
    }
}
@end
