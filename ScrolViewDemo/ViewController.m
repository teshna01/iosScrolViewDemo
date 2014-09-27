//
//  ViewController.m
//  ScrolViewDemo
//
//  Created by JF（朝阳区图书馆） on 14-9-27.
//  Copyright (c) 2014年 witmob. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CATransaction.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize dwNum;

- (void)viewDidLoad {
    //button的文字
    titleArray = [[NSMutableArray alloc]initWithObjects:@"View1",@"View2",@"View3",@"View4",@"View5",@"View6", nil];
    viewArray=[[NSMutableArray alloc]init];
    //动态生成视图并添加按钮
    
    for (int i=0;i<6; i++) {
        dwView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 460)];
        dwView.tag=i;
        dwBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        dwBtn.frame=CGRectMake(100,470,55,55);
        dwBtn.tag=i;
        [dwBtn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
//       [dwBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [dwView addSubview:dwBtn];
        [viewArray addObject:dwView];
        [self.view addSubview:dwView];
    }
    //左右滑动识别
    
    [self.view bringSubviewToFront:[viewArray objectAtIndex:0]];
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    // [recognizer release];
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    //[recognizer release ];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
  //手势
- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)sender{
    if (sender.direction==UISwipeGestureRecognizerDirectionLeft )
    {
        if(dwNum<0)
            dwNum=0;
        else if(dwNum!=0)
            dwNum--;
        [UIView beginAnimations:nil context:nil];
        //持续时间
        [UIView setAnimationDuration:1.0];
        //在出动画的时候减缓速度
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        //添加动画开始及结束的代理
        [UIView setAnimationDelegate:self];
        [UIView setAnimationWillStartSelector:@selector(begin)];
       // [UIView setAnimationDidStopSelector:@selector(stopAni)];
        //动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        //View切换
        for (int i=0; i<6; i++) {
            if(dwNum!=i)
                [[viewArray objectAtIndex:i] removeFromSuperview];
            else
                [self.view insertSubview:[viewArray objectAtIndex:i] atIndex:0];
        }
        
        [UIView commitAnimations];
    }
    else if((sender.direction=UISwipeGestureRecognizerDirectionRight))
    {
        if(dwNum>5)
            dwNum=5;
        else if(dwNum!=5)
            dwNum++;
        [UIView beginAnimations:nil context:nil];
        //持续时间
        [UIView setAnimationDuration:1.0];
        //在出动画的时候减缓速度
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        //添加动画开始及结束的代理
        [UIView setAnimationDelegate:self];
        [UIView setAnimationWillStartSelector:@selector(begin)];
        //[UIView setAnimationDidStopSelector:@selector(stopAni)];
        //动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        //View切换
        for (int i=0; i<10; i++) {
            if(dwNum!=i)
                [[viewArray objectAtIndex:i] removeFromSuperview];
            else
                [self.view insertSubview:[viewArray objectAtIndex:i] atIndex:0];
        }
        [UIView commitAnimations];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
