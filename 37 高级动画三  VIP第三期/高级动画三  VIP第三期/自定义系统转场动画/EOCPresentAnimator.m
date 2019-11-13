//
//  EOCPresentAnimator.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//  present动画

#import "EOCPresentAnimator.h"

@implementation EOCPresentAnimator

//时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.f;
}

//动作 系统会自己调用
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    //上下文对象包含了全部信息
    //获取容器View
    UIView *containerView = transitionContext.containerView;
    //获取到toView:也就是说从ViewCtrlA跳转到ViewCtrlB，toView是ViewCtrlB.view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:toView];
    
    //rect范围的偏移量,大于0在右半边,下边
    CGRect frame = CGRectOffset(toView.frame, 0.f, [UIScreen mainScreen].bounds.size.height);
    toView.frame = frame;
    
    [UIView animateWithDuration:2.f animations:^{
        toView.frame = CGRectOffset(toView.frame, 0.f, -[UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        //结束上下文
        [transitionContext completeTransition:YES];
    }];
}

@end
