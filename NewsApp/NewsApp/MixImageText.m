//
//  MixImageText.m
//  NewsApp
//
//  Created by space on 2018/6/14.
//  Copyright © 2018 space. All rights reserved.
//

#import "MixImageText.h"

@interface MixImageText(){
    UIImageView *imageView;
    UILabel *label;
    UILabel *url;
}

@end

@implementation MixImageText

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height*2, self.frame.size.height)];
        [self addSubview:imageView];
        
        label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height*2, 0, self.frame.size.width-self.frame.size.height*2, self.frame.size.height-20)];
        label.font = [UIFont systemFontOfSize:12.0];
        label.numberOfLines = 0;
        [self addSubview:label];
        
        url = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height*2, self.frame.size.height-20, self.frame.size.width-self.frame.size.height*2, 20)];
        url.textColor = [UIColor orangeColor];
        url.textAlignment = NSTextAlignmentRight;
        [self addSubview:url];
        
    }
    return self;
}

-(void) setImage:(NSString*) image {
    imageView.image = [UIImage imageNamed:image];
}

-(void) setTitle:(NSString*)title {
    label.text = title;
}

-(void) setUrl:(NSString *)path {
    url.text = path;
}

@end
