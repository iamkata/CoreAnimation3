//
//  EOCDismissAnimator.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//  dismiss动画

#import "EOCDismissAnimator.h"

@implementation EOCDismissAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = transitionContext.containerView;
    
    //获取到toView:从ViewCtrlB dismiss 到ViewCtrlA   fromView是B， toView是A
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect finalFrame = CGRectOffset(fromView.frame, 0.f, [UIScreen mainScreen].bounds.size.height);
    
    //containerView里面有fromView了
    //把toView放到最下面
    [containerView insertSubview:toView atIndex:0];
    
    [UIView animateWithDuration:2.f animations:^{
        fromView.frame = finalFrame;
    } completion:^(BOOL finished) {
        //它肯定实现了移除fromView的操作  取消就不完成
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
        //自己移除fromView不行,如果不结束转场,transitionView还在
        //[fromView removeFromSuperview];
    }];
}

@end
