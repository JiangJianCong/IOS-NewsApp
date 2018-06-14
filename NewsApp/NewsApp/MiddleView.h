//
//  MiddleView.h
//  NewsApp
//
//  Created by space on 2018/6/14.
//  Copyright © 2018 space. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleView : UIView

@property(nonatomic, strong)NSArray *newsInfo;
-(void) addNewsScrollView;
-(id)initWithFrame:(CGRect)frame newsType:(NSArray *)type;
-(void) addMixImageTextFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title url:(NSString*)url;
@end
