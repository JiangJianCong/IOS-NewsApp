//
//  PromptView.m
//  NewsApp
//
//  Created by space on 2018/6/14.
//  Copyright © 2018 space. All rights reserved.
//

#import "PromptView.h"

@implementation PromptView

-(id)initWithPoint:(CGPoint)point meaasge:(int) message {
    CGRect rect;
    NSString *labelStr = nil;
    if (message < 10) {
        rect = CGRectMake(point.x, point.y, 20, 20);
        labelStr = [NSString stringWithFormat:@"%d",message];
    } else if (message < 100) {
        rect = CGRectMake(point.x, point.y, 40, 20);
        labelStr = [NSString stringWithFormat:@"%d",message];
    } else {
        rect = CGRectMake(point.x, point.y, 40, 20);
        labelStr = [NSString stringWithFormat:@"%@",@"99+"];
    }
    
    self = [super initWithFrame:rect];
    
    if (self) {
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor redColor];
        self.text = labelStr;
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = true; // UIView layer剪切
    }
    return self;
    
}

@end
