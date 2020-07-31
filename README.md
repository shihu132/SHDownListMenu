# 菜单下拉功能

#### 介绍
iOS 菜单下拉控件，在项目中常用

/**
 * 使用示例说明:
 *
        #import "SHNaBarMenuDownView.h"
 
        NSArray *array = [NSArray arrayWithObjects:@"石虎",@"每行间距后处理额外距后处理额事件每行间距后处理额",
                                                   @"TI 每行间距后处理额外距加班",@"qqqqqqq",@"范冰冰",@"毛主席",
                                                   @"咔咔咔咔咔咔",@"小可爱",@"经济法",@"发来霍山石斛",
                                                   @"换手机号三角函数",@"羿发热包卡包",nil];
        __weak typeof(self)weakSelf = self;
        SHNaBarMenuDownView *menuDownView = [[SHNaBarMenuDownView alloc] initWithFrame:CGRectZero array:array title:array[4] classView:self.view callBlock:^(NSInteger index) {
                    //index 可以根据索引处理事件
                    //点击选中 cell 后处理额外事件
        }];
         
        [self.view addSubview:menuDownView];

        //额外设置 标题的样式 (有默认值)
        menuDownView.titelButtonBgColor   = [UIColor redColor];
        menuDownView.titelButtonFont      = 12;
        menuDownView.titelButtonImage     = [UIImage imageNamed:@"sp_rightarrow_enable"];
        menuDownView.titelButtonFontColor = [UIColor purpleColor];

        //额外设置 内容的样式 (有默认值)
        menuDownView.menuDownListView.titelListFontColor = [UIColor redColor];
        menuDownView.menuDownListView.titelListFont      = 30;

        //布局
        [menuDownView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.bottom.equalTo(self.navigationBarView.mas_bottom);
             make.height.mas_equalTo(self.navigationBarView.titleLabel.mas_height);
             make.width.lessThanOrEqualTo(kMainScreenWidth - 120);
        }];
        //没有 Masonry 可以系统布局
        menuDownView.frame = CGRectMake(0, NAVIGATIONBAR_HEIGHT, 110, 25);
        menuDownView.tz_centerX = self.view.tz_centerX;


     
 /**
 * 注意点 - 防止数组越界
         - 依赖 第三方 轻量级 布局 Masonry ,很低,可以不用
         - 在项目中如果不显示 可以查看添加 View 层级 或者 列表高度 调整

 * 反馈及联系方式:
 *          QQ群号:  807236138
 *          Email : 1224614774@qq.com
 
 **/


#### 软件架构
软件架构说明


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 码云特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5.  码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
