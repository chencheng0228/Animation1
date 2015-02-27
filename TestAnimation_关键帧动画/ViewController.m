//
//  ViewController.m
//  TestAnimation_关键帧动画
//
//  Created by admin on 15-1-16.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)CALayer *nowLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.nowLayer = [CALayer layer];
    self.nowLayer.bounds = CGRectMake(100, 100, 100, 100);
    self.nowLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.nowLayer];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
         //创建核心动画
         CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
         //CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:<#(NSString *)#>];
         //平移   旋转：transform.rotation
         keyAnima.keyPath=@"position";

    
        CGMutablePathRef path=CGPathCreateMutable();
    
        //告诉系统要执行什么动画
         //设置一个圆的路径
         CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
         //将动画路径设置为自定义的path
         keyAnima.path=path;
         CGPathRelease(path);
    
//         //告诉系统要执行什么动画
//         NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//         NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
//         NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
//         NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
//         NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
//         keyAnima.values=@[value1,value2,value3,value4,value5];
         //设置动画执行完毕后，不删除动画
         keyAnima.removedOnCompletion=NO;
         //设置保存动画的最新状态
         keyAnima.fillMode=kCAFillModeForwards;
         //设置动画执行的时间
         keyAnima.duration=4.0;
         //重复时间
         keyAnima.repeatDuration = 10;
    
         //设置动画的节奏
         keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
         //设置代理，开始—结束
         keyAnima.delegate=self;
    
         //添加核心动画 ，填入的key值，之后我们就可以通过key值找到对应的动画，调用方法：removeAnimationForKey可以将该动画给移除
         [self.nowLayer addAnimation:keyAnima forKey:@"keyAnima"];
    
}
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画开始");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"动画结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
