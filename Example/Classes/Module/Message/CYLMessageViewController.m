//
//  CYLMessageViewController.m
//  CYLTabBarController
//
//  v1.21.x Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2018 https://github.com/ChenYilong . All rights reserved.
//

#import "CYLMessageViewController.h"
#import "CYLTabBarController.h"
#import "QIMKit.h"
#import "QIMSDK.h"

@implementation CYLMessageViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";    //✅sets navigation bar title.The right way to set the title of the navigation
    
    [QIMSDKUIHelper sharedInstanceWithRootNav:self.navigationController rootVc:self];
    BOOL success = [[QIMKit sharedInstance] qimNav_updateNavigationConfigWithDomain:@"qunar.com" WithUserName:@"lilulucas.li"];
    if (success) {
        [[QIMKit sharedInstance] loginWithUserName:@"lilulucas.li" WithPassWord:@"xxxlihaibin.li"];
        [[QIMKit sharedInstance] setUserObject:@(YES) forKey:@"notNeedShowLeaderInfo"]; //不显示手机号，直属领导
        [[QIMKit sharedInstance] setUserObject:@(YES) forKey:@"notNeedShowEmailInfo"]; //不显示发送邮件，评论
        [[QIMKit sharedInstance] setUserObject:@(NO) forKey:@"isShowGroupQRCode"];  //不显示群二维码
        [[QIMKit sharedInstance] setUserObject:@(NO) forKey:@"isShowLocalQuickSearch"]; //不显示快捷搜索
        [[QIMKit sharedInstance] removeExpandItemsForItemId:@"Location"];
    }
    
    UIView *sessionView = [[QIMSDKUIHelper shareInstance] getQIMSessionListViewWithBaseFrame:self.view.bounds];
    [self.view addSubview:sessionView];
}

@end
