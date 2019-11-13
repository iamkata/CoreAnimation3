//
//  ViewController.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "ViewController.h"
#import "EOCNextViewController.h"
#import "EOCPresentAnimator.h"
#import "EOCDismissAnimator.h"
#import "EOCInteractiveTransition.h"
#import "EOCContainerViewController.h"
#import "EOCChildViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate> {
    
    EOCInteractiveTransition *interactiveTransition; //控制转场进度的类
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray *titleArr = @[@"自定义系统转场", @"自定义容器实现转场动画"];
    //控制转场进度的类
    interactiveTransition = [[EOCInteractiveTransition alloc] init];
    
    for (int i=0; i<titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100.f, 100.f+100.f*i, 200.f, 50.f);
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.f)/255.f green:arc4random_uniform(256.f)/255.f blue:arc4random_uniform(256.f)/255.f alpha:1.f];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [btn setAccessibilityValue:[NSString stringWithFormat:@"%d", i]];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)btn {
    
    int index = btn.accessibilityValue.intValue;
    
    if (0 == index) {

        EOCNextViewController *nextViewCtrl = [[EOCNextViewController alloc] init];
        [interactiveTransition transitionToViewController:nextViewCtrl];
        nextViewCtrl.transitioningDelegate = self;
        [self presentViewController:nextViewCtrl animated:YES completion:nil];
        
    } else if (1 == index) {
        
        EOCContainerViewController *containerViewCtrl = [[EOCContainerViewController alloc] init];
        
        NSMutableArray *childViews = [NSMutableArray array];
        NSArray *imgArrs = @[@"First", @"Second", @"Third"];
        
        for (int i=0; i<3; i++) {
            
            EOCChildViewController *childViewCtrl = [[EOCChildViewController alloc] init];
            childViewCtrl.bgColor = [UIColor colorWithRed:arc4random_uniform(256.f)/255.f green:arc4random_uniform(256.f)/255.f blue:arc4random_uniform(256.f)/255.f alpha:1.f];
            [childViewCtrl setAccessibilityValue:imgArrs[i]];
            childViewCtrl.text = [NSString stringWithFormat:@"View %d", i];
            [childViews addObject:childViewCtrl];
            
        }
        
        containerViewCtrl.viewControllers = childViews;
        [self presentViewController:containerViewCtrl animated:YES completion:nil];
        
    }
    
}

#pragma mark - UIViewControllerTransitioningDelegate
//为present的界面添加动画, 返回的动画对象要遵守UIViewControllerAnimatedTransitioning协议
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [EOCPresentAnimator new];
}

//为dismiss的界面添加动画, 返回的动画对象要遵守UIViewControllerAnimatedTransitioning协议
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [EOCDismissAnimator new];
}

//控制转场进度的类, 返回的对象要遵守UIViewControllerInteractiveTransitioning协议
//系统的类UIPercentDrivenInteractiveTransition已经遵守了这个协议, 我们直接使用它的子类
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return  interactiveTransition;
}

@end
