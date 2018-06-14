//
//  ViewController.m
//  NewsApp
//
//  Created by space on 2018/6/13.
//  Copyright © 2018 space. All rights reserved.
//


#import "ViewController.h"
#import "TopView.h"
#import "Constant.h"
#import "MiddleView.h"

@interface ViewController () {
    TopView *topView;
    MiddleView *middleView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopView];
    [self addMiddleView];
    
}

-(void) addMiddleView {
    middleView = [[MiddleView alloc]initWithFrame:CGRectMake(0, 60, UISCREEN_WIDTH, 60) newsType:@[@"web计算",@"计信息管理系统",@"移动互联网",@"微积分",@"线性代数",@"软件工程"]];
    [self.view addSubview:middleView];
    
}

-(void)addTopView {
    topView = [[TopView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, 60)];
    [topView setTitle:@"space"];
    [self.view addSubview:topView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
