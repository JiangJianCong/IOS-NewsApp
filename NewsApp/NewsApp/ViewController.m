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
#import "MyButton.h"

@interface ViewController () {
    TopView *topView;
    MiddleView *middleView;
    UIView *searchView;
    UISearchBar *searchBar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopView];
//    [self addMiddleView];
    [self addMyButton];
    [self addSearchView];
}

-(void) addSearchView {
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(UISCREEN_WIDTH-55, 15, 30, 30)];
    [bt setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:bt];
}
-(void) searchAction {
    searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, UISCREEN_WIDTH, UISCREEN_HEIGHT - 60)];
    searchView.backgroundColor = [UIColor whiteColor];
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
    [searchView addSubview:searchBar];
    [self.view addSubview:searchView];
}

// 点击
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [searchBar resignFirstResponder];
    if (searchView) {
        [searchView removeFromSuperview];
        searchView = nil;
    }

}


-(void) addMyButton {
    
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 65, UISCREEN_WIDTH, 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    MyButton *myButton = [[MyButton alloc]initWithFrame:CGRectMake(0, 0, 60, 80) image:@"tel.png" title:@"电话"];
    [view addSubview:myButton];
}


-(void) addMiddleView {
    middleView = [[MiddleView alloc]initWithFrame:CGRectMake(0, 60, UISCREEN_WIDTH, 40+200+140) newsType:@[@"web计算",@"计信息管理系统",@"移动互联网",@"微积分",@"线性代数",@"软件工程"]];
    [self.view addSubview:middleView];
    
    //    image info;
    NSDictionary *newsinfo0 = [NSDictionary dictionaryWithObjectsAndKeys:@"1.png",@"image",@"iOS9的那些神坑",@"info", nil];
    NSDictionary *newsinfo1 = [NSDictionary dictionaryWithObjectsAndKeys:@"2.png",@"image",@"iOS9的摄像头",@"info", nil];
    NSDictionary *newsinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"3.png",@"image",@"iOS9UiStackView",@"info", nil];
    
    NSArray *newsInfo = [[NSArray alloc]initWithObjects:newsinfo0,newsinfo1,newsinfo2,nil];
    
    //    数据传递? 1 自定义构造方法 2 属性
    middleView.newsInfo = newsInfo;
    [middleView addNewsScrollView];
    
    //    添加图文混排;
    [middleView addMixImageTextFrame:CGRectMake(0, 245, UISCREEN_WIDTH, 60) image:@"1.jpg" title:@"xdwefwfwfwgergegergegegergerwrfwfwfwefjwuifhiuwhiurhohoihwoifhowhfoiwhfoiwhfiowehfoiwhfoiwhfoiwhfoiwhfiowehfiowhfowehfoiwhfiowhfiowfhiowehfoiwhefiowhfoiwehfoiwhuohvsnsjvnjknfwfoi" url:@"www.baidu.com"];
    
    [middleView addMixImageTextFrame:CGRectMake(0, 310, UISCREEN_WIDTH, 60) image:@"2.jpg" title:@"xdwefwfwfwgergegergegegergerwrfwfwfwefjwuifhiuwhiurhohoihwoifhowhfoiwhfoiwhfiowehfoiwhfoiwhfoiwhfoiwhfiowehfiowhfowehfoiwhfiowhfiowfhiowehfoiwhefiowhfoiwehfoiwhuohvsnsjvnjknfwfoi" url:@"www.baidu.com"];
    
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
