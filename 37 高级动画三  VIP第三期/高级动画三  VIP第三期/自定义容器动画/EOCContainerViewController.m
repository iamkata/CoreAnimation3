//
//  EOCContainerViewController.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCContainerViewController.h"
#import "EOCChildViewController.h"
#import "EOCAnimatorTwo.h"
#import "MyTransitionContext.h"

@interface EOCContainerViewController () {
    
    UIView *topView;
    UIView *containerView;
    
}

@end

@implementation EOCContainerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 60.f)];
    topView.backgroundColor = [UIColor whiteColor];
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 60.f, self.view.frame.size.width, self.view.frame.size.height - 60.f)];
    containerView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:containerView];
    [self.view addSubview:topView];
    
    //topView上添加buttons
    [self addChildViewControllerButtons];
    self.selectedViewController = (self.selectedViewController?:self.viewControllers[0]);
    
}

- (void)addChildViewControllerButtons {
    
    NSInteger count = self.viewControllers.count;
    
    for (int i=0; i<_viewControllers.count; i++) {
        
        EOCChildViewController *childViewController = _viewControllers[i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *icon = [UIImage imageNamed:childViewController.accessibilityValue];
        [btn setImage:icon forState:UIControlStateNormal];
        UIImage *selectedIcon = [UIImage imageNamed:[NSString stringWithFormat:@"%@ Selected", childViewController.accessibilityValue]];
        [btn setImage:selectedIcon forState:UIControlStateSelected];
        
        btn.tag = 1000+i;
        [btn addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchDown];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width/(2*count+1);
        
        btn.frame = CGRectMake(width+i*width, 5.f, width, width);
        [topView addSubview:btn];
        
    }
    
}

#pragma mark - btnAction
- (void)btnTap:(UIButton *)btn {
    
    UIViewController *selectedViewCtrl = _viewControllers[btn.tag - 1000];
    self.selectedViewController = selectedViewCtrl;
    
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    
    //转场动画
    [self transitionToChildViewController:selectedViewController];
    
    //成员变量设置
    _selectedViewController = selectedViewController;
    
    //按钮图片改变
    __weak typeof(self) weakSelf = self;
    [topView.subviews enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        btn.selected = (weakSelf.viewControllers[idx] == weakSelf.selectedViewController);
    }];
}

#pragma mark - 自定义转场
- (void)transitionToChildViewController:(UIViewController *)toViewController {
    
    //首先判断self里有没有childViewController
    UIViewController *fromViewController = [self.childViewControllers count]>0?self.childViewControllers[0]:nil;
    
    //如果两者一样，啥也不做，直接返回
    if (fromViewController == toViewController) {
        return;
    }
    
    //把toViewController添加进来
    [self addChildViewController:toViewController];
    
    if (!fromViewController) {
        
        [containerView addSubview:toViewController.view];
        return;
    }
    
    //当是从一个ViewController跳转到另外一个的时候，有转场动画
    
    //模仿系统的, 创建我们自己的转场上下文
    id <UIViewControllerAnimatedTransitioning>animator = [[EOCAnimatorTwo alloc] init];

    MyTransitionContext *transitionContext = [[MyTransitionContext alloc] initWithFromViewController:fromViewController toViewController:toViewController];

    //我们手动调用这个方法
    [animator animateTransition:transitionContext];
}

@end
