//
//  ViewController.m
//  SHDownListMenu
//
//  Created by 石虎 on 2020/7/18.
//  Copyright © 2020 cdel. All rights reserved.
//

#import "ViewController.h"
#import "SHNaBarMenuDownView.h"
#import "UIView+Frame.h"

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?     CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define NAVIGATIONBAR_HEIGHT (iPhoneX ? 89 : 65-25)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self addNaBarMenuDownView];
    
}

- (void)addNaBarMenuDownView {
        //测试-shihu
        NSArray *array = [NSArray arrayWithObjects:@"石虎",@"每行间距后处理额外距后处理额事件每行间距后处理额",
                                                  @"TI 每行间距后处理额外距加班",@"qqqqqqq",@"范冰冰",@"毛主席",
                                                  @"咔咔咔咔咔咔",@"小可爱",@"经济法",@"发来霍山石斛",
                                                  @"换手机号三角函数",@"羿发热包卡包",nil];
   // __weak typeof(self)weakSelf = self;
    SHNaBarMenuDownView *menuDownView = [[SHNaBarMenuDownView alloc] initWithFrame:CGRectZero array:array title:array[4] classView:self.view callBlock:^(NSInteger index) {
        //点击选中 cell 后处理额外事件
        }];
    
//        menuDownView.titelButtonBgColor   = [UIColor redColor];
//        menuDownView.titelButtonFont      = 12;
//        menuDownView.titelButtonImage     = [UIImage imageNamed:@"sp_rightarrow_enable"];
//        menuDownView.titelButtonFontColor = [UIColor purpleColor];
        
//        menuDownView.menuDownListView.titelListFontColor = [UIColor redColor];
//        menuDownView.menuDownListView.titelListFont = 30;
    
        menuDownView.backgroundColor = [UIColor redColor];
        [self.view addSubview:menuDownView];

        /**
        [menuDownView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.navigationBarView.mas_bottom);
            make.height.mas_equalTo(self.navigationBarView.titleLabel.mas_height);
            make.width.lessThanOrEqualTo(kMainScreenWidth - 120);
        }];
       */
    menuDownView.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT, 110, 25);
    menuDownView.tz_centerX = self.view.tz_centerX;
}

@end
