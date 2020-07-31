//
//  SHNaBarMenuDownListView.m
//
//  Created by 石虎 on 2020/7/10.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHNaBarMenuDownListView.h"
#import "SHNaBarMenuDownCell.h"
#import "SHUIButton.h"

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?     CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define NAVIGATIONBAR_HEIGHT (iPhoneX ? 89 : 65)

@interface SHNaBarMenuDownListView ()
<UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) NSArray     *array;
@property (nonatomic, strong) UIButton    *menuButton;    //从Controller传过来的控制器
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIControl   *backgroundControl;
@property (nonatomic, assign) NSInteger   index;          //记录选中行
@property (nonatomic, assign) CGFloat     rowHeight;      // 行高
@property (nonatomic, assign) BOOL        isFirstEntry;   // 是否是第一次进入
@end

@implementation SHNaBarMenuDownListView

- (id)initWithListDataSource:(NSArray *)array
                 menuButton:(SHUIButton *)menuButton {
    
    self = [super initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT,  [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    if (self) {
        self.array        = array;
        self.menuButton   = menuButton;
        self.rowHeight    = 50.0;
        self.isFirstEntry = NO;
    }   return self;
}
/**
 *   显示下拉列表
 */
- (void)showList {
    [self addSubview:self.backgroundControl];
    [self.backgroundControl addSubview:self.tableView];
    [self.tableView reloadData];

    CGFloat sumHeight = 0.0;
    CGFloat listHeight = self.rowHeight * self.array.count;
    if (self.rowHeight * self.array.count >= 420) {
        sumHeight = 420;
    } else {
        sumHeight = listHeight;
    }
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundControl.backgroundColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.5];
        self.tableView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, sumHeight);
        self.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT,  [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    }];
}
/**
 *  隐藏
 */
- (void)hiddenList {
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundControl.backgroundColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.0];
        self.tableView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0);
        self.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT,  [[UIScreen mainScreen] bounds].size.width, 0);
    } completion:^(BOOL finished) {
        [self.backgroundControl removeFromSuperview];
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SHNaBarMenuDownCell *cell = [SHNaBarMenuDownCell cellWithTableView:tableView];
    if (self.array.count > indexPath.row) {
        cell.titleLabel.text = self.array[indexPath.row];
        if ([cell.titleLabel.text isEqualToString:@""]) {
            cell.titleLabel.text = @"无数据";
        }
    }
    [self setMenuDownCellStyle:cell];
    if (self.index == indexPath.row || self.isFirstEntry == NO) {
        if ([cell.titleLabel.text isEqualToString:self.menuButton.titleLabel.text]) {
                cell.titleLabel.textColor = [UIColor redColor];
        }
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}

#pragma mark ----------------UITableView  表的选中方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.isFirstEntry = YES;
    [self hiddenList];
    self.index = indexPath.row;
    if ([self.delegate respondsToSelector:@selector(dropDownListParame:clickIndex:)]) {
        [self.delegate dropDownListParame:self.array[indexPath.row] clickIndex:indexPath.row];
    }
}

- (UITableView *)tableView {
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:
                      CGRectMake(0, 0,
                                 [[UIScreen mainScreen] bounds].size.width, 0) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIControl *)backgroundControl {

    if (!_backgroundControl) {
        _backgroundControl = [[UIControl alloc] initWithFrame:
                              CGRectMake(0, 0,
                                         [[UIScreen mainScreen] bounds].size.width,
                                         [[UIScreen mainScreen] bounds].size.height)];
        [_backgroundControl addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        _backgroundControl.backgroundColor = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.5];
    }
    return _backgroundControl;
}

- (NSArray *)array {
    if (!_array) {
        _array = [NSArray array];
    }
    return _array;
}

- (void)dismiss {
    !self.dismissBlock ? : self.dismissBlock();
}

#pragma mark -
#pragma mark - Setter Method
- (void)setMenuDownCellStyle:(SHNaBarMenuDownCell *)cell {
    cell.titelCellFont = _titelListFont;
    cell.titelCellFontColor = _titelListFontColor;
}

@end

