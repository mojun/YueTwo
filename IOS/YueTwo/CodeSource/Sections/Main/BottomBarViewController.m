//
//  BottomBarViewController.m
//  YueTwo
//
//  Created by mo jun on 10/21/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import "BottomBarViewController.h"
#import "YTBarButtonView.h"

@interface BottomBarViewController (){
    YTBarButtonView *_chatItem;
    YTBarButtonView *_historyItem;
    YTBarButtonView *_shareItem;
}

@end

@implementation BottomBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _chatItem = [[YTBarButtonView alloc]init];
    [self.view addSubview:_chatItem];
    [_chatItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(90);
    }];
    
    _historyItem = [[YTBarButtonView alloc]init];
    [self.view addSubview:_historyItem];
    [_historyItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(90);
    }];
    
    _shareItem = [[YTBarButtonView alloc]init];
    [self.view addSubview:_shareItem];
    [_shareItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(90);
    }];
    
    [_chatItem.button setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    [_historyItem.button setImage:[UIImage imageNamed:@"history"] forState:UIControlStateNormal];
    [_shareItem.button setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    
    [_chatItem setBadgeText:@"33"];
    [_historyItem setBadgeText:@"49"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
