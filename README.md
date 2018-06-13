# IOS-NewsApp

## 本项目是用于熟悉UI控件而学习的一个小项目

### 此项目没有适配其他屏幕  使用UIView来模仿视图控制器

#### 公共部分
- 加入了一个constant.h文件，用来放常量，方便其他地方调用
```objective-c
// 屏幕的宽高
#define UISCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UISCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
```

1. 完成顶部的TopView
	- 对TopView.m里面的label位置的计算
	- 外放了一个方法给外部调用，用来修改label的值
```objective-c
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
```