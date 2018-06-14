//
//  MiddleView.m
//  NewsApp
//
//  Created by space on 2018/6/14.
//  Copyright © 2018 space. All rights reserved.
//

#import "MiddleView.h"
#import "Constant.h"
#import "PromptView.h"
#import "MaskView.h"
#import "MixImageText.h"

@interface MiddleView()<UIScrollViewDelegate> {
    NSArray *types;
    UIScrollView *scrollView;
    UIScrollView *newScrollView;
    NSMutableArray *arrayInfo;
    MaskView *maskView;
}
@end


@implementation MiddleView

-(id)initWithFrame:(CGRect)frame newsType:(NSArray *)type {
    self = [super initWithFrame: frame];
    if (self) {
        types = type;
        [self addScrollView];
    }
    return self;
}


/**
 加上图文描述

 @param frame CGRect
 @param image 照片名
 @param title 标题
 @param url 地址
 */
-(void) addMixImageTextFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title url:(NSString*)url {
    MixImageText *mixImageText = [[MixImageText alloc]initWithFrame:frame];
    [self addSubview:mixImageText];
    [mixImageText setImage:image];
    [mixImageText setTitle:title];
    [mixImageText setUrl:url];
}

/**
 新增轮播图
 */
-(void) addNewsScrollView {
    newScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, 414, 200)];
    newScrollView.contentSize = CGSizeMake(414*3, 200);
    newScrollView.contentOffset = CGPointMake(0, 0);
    newScrollView.showsHorizontalScrollIndicator = false;
    newScrollView.pagingEnabled = true;
    newScrollView.delegate = self;
    
    int i = 0;
    arrayInfo = [[NSMutableArray alloc]init];
    for (NSDictionary *item in _newsInfo) {
        NSString *image = [item valueForKey:@"image"];
        NSString *info = [item valueForKey:@"info"];
        [arrayInfo addObject:info];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(414*i++, 0, 414, 200)];
        imageView.image = [UIImage imageNamed:image];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [newScrollView addSubview:imageView];
    }
    
    [self addSubview:newScrollView];
    
    maskView = [[MaskView alloc] initWithFrame:CGRectMake(0, 240-20, 414, 20)];
    
    NSString *title = [arrayInfo objectAtIndex:0];
    [maskView setTitle:title];
    [maskView setPageControlNum:0];
    [self addSubview:maskView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int currentPageNum = (int)scrollView.contentOffset.x / 414;
    NSString *title = [arrayInfo objectAtIndex:currentPageNum];
    [maskView setTitle:title];
    [maskView setPageControlNum:currentPageNum];
}

/**
 添加UIScrollView
 */
-(void)addScrollView {
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 40)];
    scrollView.contentSize = CGSizeMake(100*types.count, 40);
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.backgroundColor = PINK_COLOR;
    scrollView.showsHorizontalScrollIndicator = false;
    [self addSubview:scrollView];
    for (int i = 0 ; i < types.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*100, 0, 100, 40)];
        NSString *buttonTitle = [types objectAtIndex:i];
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        // 1 frame 根据点击位置判断位置;
        // 2根据标签来判断点击的按钮
        button.tag = 10000+i; // 10000 - 10005
        [scrollView addSubview:button];
        // 给第一个按钮添加边框
        if (i == 0) {
            
            button.layer.borderColor = [UIColor cyanColor].CGColor;
            button.layer.borderWidth = 5.0;
            button.layer.cornerRadius = 5.0;
            PromptView *promptView = [[PromptView alloc] initWithPoint:CGPointMake(button.frame.size.width-20, 0) meaasge:5];
            [button addSubview:promptView];
        }
        if (i == 1) {
            PromptView *promptView = [[PromptView alloc] initWithPoint:CGPointMake(button.frame.size.width-40, 0) meaasge:22];
            [button addSubview:promptView];
        }
        if (i == 3) {
        
            PromptView *promptView = [[PromptView alloc] initWithPoint:CGPointMake(button.frame.size.width-40, 0) meaasge:99];
            [button addSubview:promptView];
        }
        if (i == 4) {
            PromptView *promptView = [[PromptView alloc] initWithPoint:CGPointMake(button.frame.size.width-20, 0) meaasge:300];
            [button addSubview:promptView];
        }
    }
}

-(void) buttonAction:(UIButton*) button {
    button.layer.borderColor = [UIColor cyanColor].CGColor;
    button.layer.borderWidth = 5.0;
    button.layer.cornerRadius = 5.0;
    for (UIButton *item in scrollView.subviews) {
        if (item.tag >=10000 && item.tag <= 10000+types.count &&(item.tag!=button.tag)) {
            item.layer.borderWidth = 0;
        }
    }
}

@end
