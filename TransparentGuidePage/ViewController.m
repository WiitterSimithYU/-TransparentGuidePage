//
//  ViewController.m
//  TransparentGuidePage
//
//  Created by wangqibin on 2018/4/20.
//  Copyright © 2018年 sensmind. All rights reserved.
//

#import "ViewController.h"
#import "HWGuidePageManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建控件
    [self creatControl];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 引导视图
    [self showGuidePage];
}

- (void)creatControl
{
    // 底图
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imgView.image = [UIImage imageNamed:@"backImg"];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imgView];
}

- (void)showGuidePage
{
    // 判断是否已显示过
    if (![[NSUserDefaults standardUserDefaults] boolForKey:HWGuidePageHomeKey]) {
        // 显示
        [[HWGuidePageManager shareManager] showGuidePageWithType:HWGuidePageTypeHome completion:^{
            [[HWGuidePageManager shareManager] showGuidePageWithType:HWGuidePageTypeMajor];
        }];
    }
}

@end
