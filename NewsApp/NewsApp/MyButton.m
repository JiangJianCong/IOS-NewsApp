//
//  MyButton.m
//  NewsApp
//
//  Created by space on 2018/6/14.
//  Copyright © 2018 space. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(id) initWithFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        
        // 居中显示
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}


/**
 重写方法
 确定image的位置

 
 @param contentRect mybutton frame
 @return 返回的坐标
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = contentRect.size.width;
    CGFloat h = w;
    CGFloat x = 0;
    CGFloat y = 0;
    return CGRectMake(x, y, w, h);
}


/**
 确定title的位置

 @param contentRect 原本的位置
 @return 返回的位置
 */
-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height-contentRect.size.width;
    CGFloat x = 0;
    CGFloat y = contentRect.size.width;
    return CGRectMake(x, y, w, h);
}

@end
