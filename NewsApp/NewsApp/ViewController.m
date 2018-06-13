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

@interface ViewController () {
    TopView *topView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopView];
    
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
