//
//  TopView.m
//  NewsApp
//
//  Created by space on 2018/6/13.
//  Copyright © 2018 space. All rights reserved.
//

#import "TopView.h"
#import "Constant.h"

@implementation TopView

// 构造方法
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:138.0/255.0 green:206.0/255.0 blue:245.0/255.0 alpha:1.0];
    }
    return self;
}

/**
 设置title

 @param title 改变title
 */
-(void)setTitle:(NSString*) title {
    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    // 清除color
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    UIFont *font = [UIFont systemFontOfSize:20.0];
    label.font = font;
    
    // 动态计算位置,字典类型
    CGSize labelHW = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    
    label.frame = CGRectMake((UISCREEN_WIDTH-labelHW.width)/2, 20, labelHW.width, labelHW.height);
    [self addSubview:label];
}

@end
