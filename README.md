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

2. 中间部分的轮播图
  - 新建一个MiddleView类
  - 使用一个自定义构造方法，传递列表数组进去即可，方法简单，直接看代码即可

3. 分类消息提示
	- 新建一个PromprView类，继承UILabel ，在里面自定义构造方法，并且在h文件中公开
	- 具体适用法看MiddleView.m文件
```objective-c
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

```