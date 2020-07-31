//
//  SHNaBarMenuDownView.m
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//  科目切换

#import "SHNaBarMenuDownView.h"
#import "SHNaBarMenuDownListView.h"
#import "SHUIButton.h"

typedef void (^CallBlock)(NSInteger index);
@interface SHNaBarMenuDownView ()<MenuDownListViewDelegate>

@property (nonatomic, strong) NSArray  *array;
@property (nonatomic,   weak) UIView   *classView;
@property (nonatomic,   copy) CallBlock callBlock;
@property (nonatomic, strong) NSString   *title;
@property (nonatomic, strong) SHUIButton *titelButton;
@end

@implementation SHNaBarMenuDownView

- (id)initWithFrame:(CGRect)frame
              array:(NSArray *)array
              title:(NSString *)title
          classView:(UIView *)classView
          callBlock:(void(^)(NSInteger index))callBlock {
    if (self = [super initWithFrame:frame]) {
        self.array     = array;
        self.classView = classView;
        self.title     = title;
        self.callBlock = callBlock;
        [self doInit];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.titelButton];
    [self bringSubviewToFront:self.titelButton];
    [self.classView addSubview:self.menuDownListView];
    [self.classView bringSubviewToFront:self.menuDownListView];
    /**
    [self.titelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
     */
    self.titelButton.frame = CGRectMake(0, 0, 100, 25);
}

- (void)doInit {
    _titelButtonBgColor   = [UIColor clearColor];
    _titelButtonFont      = 18.0;
    _titelButtonImage     = [UIImage imageNamed:@"sj_btn_xl"];
    _titelButtonFontColor = [UIColor whiteColor];
}

#pragma mark -
#pragma mark - getter Method
- (UIButton *)titelButton {
    if (!_titelButton) {
        _titelButton = [SHUIButton buttonWithType:UIButtonTypeCustom];
        [_titelButton setTitle:([self.title isEqualToString:@""] ? @"无数据" : self.title )forState:UIControlStateNormal];
        [_titelButton setImage:_titelButtonImage forState:UIControlStateNormal];
        [_titelButton setImage:_titelButtonImage forState:UIControlStateSelected];
        [_titelButton setImage:_titelButtonImage forState:UIControlStateHighlighted];
        [_titelButton setTitleColor:_titelButtonFontColor forState:UIControlStateNormal];
        [_titelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _titelButton.titleLabel.font = [UIFont systemFontOfSize:_titelButtonFont];
        _titelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _titelButton.backgroundColor = _titelButtonBgColor;
    }
    return _titelButton;
}

- (void)buttonClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [_menuDownListView showList];
        _titelButton.imageView.transform = CGAffineTransformRotate(_titelButton.imageView.transform, M_PI);
    }else{
        [_menuDownListView hiddenList];
         _titelButton.imageView.transform = CGAffineTransformRotate(_titelButton.imageView.transform, -M_PI);
    }
}

- (SHNaBarMenuDownListView *)menuDownListView {
    if (!_menuDownListView) {
        _menuDownListView = [[SHNaBarMenuDownListView alloc] initWithListDataSource:self.array menuButton:self.titelButton];
        _menuDownListView.delegate = self;
        __weak typeof(self)weakSelf = self;
        _menuDownListView.dismissBlock = ^{
            [weakSelf.menuDownListView hiddenList];
            weakSelf.titelButton.imageView.transform = CGAffineTransformRotate(weakSelf.titelButton.imageView.transform, -M_PI);
            weakSelf.titelButton.selected = NO;
        };
    }
    return _menuDownListView;
}

#pragma mark - 代理
- (void)dropDownListParame:(NSString *)titelString clickIndex:(NSInteger)clickIndex {
    _titelButton.selected = NO;
    [_titelButton setTitle:[NSString stringWithFormat:@"%@",titelString] forState:UIControlStateNormal];
    _titelButton.imageView.transform = CGAffineTransformRotate(_titelButton.imageView.transform, -M_PI);
    [self titelButton];
    !_callBlock ? : _callBlock(clickIndex);
}

#pragma mark -
#pragma mark - Setter Method
- (void)setTitelButtonBgColor:(UIColor *)titelButtonBgColor {
    _titelButtonBgColor          = titelButtonBgColor;
    _titelButton.backgroundColor = titelButtonBgColor;
}
- (void)setTitelButtonFont:(CGFloat )titelButtonFont {
    _titelButtonFont             = titelButtonFont;
    _titelButton.titleLabel.font = [UIFont systemFontOfSize:titelButtonFont];
}
- (void)setTitleButtFont:(UIFont *)titleButtFont {
    _titleButtFont = titleButtFont;
    _titelButton.titleLabel.font = titleButtFont;
}
- (void)setTitelButtonImage:(UIImage *)titelButtonImage {
    _titelButtonImage = titelButtonImage;
    [_titelButton setImage:titelButtonImage forState:UIControlStateNormal];
}
- (void)setTitelButtonFontColor:(UIColor *)titelButtonFontColor {
    _titelButtonFontColor = titelButtonFontColor;
    [_titelButton setTitleColor:titelButtonFontColor forState:UIControlStateNormal];
}

@end

