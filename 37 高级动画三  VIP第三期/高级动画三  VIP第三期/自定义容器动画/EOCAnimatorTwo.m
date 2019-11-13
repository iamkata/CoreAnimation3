//
//  EOCAnimatorTwo.m
//  iOS动画实例VIP
//
//  Created by 八点钟学院 on 2017/7/31.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCAnimatorTwo.h"

@implementation EOCAnimatorTwo

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.f;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];

    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    toView.alpha = 0.f;
    
    [UIView animateWithDuration:1.f animations:^{
        
        fromView.transform = CGAffineTransformMakeScale(0.1f, 0.1);
        toView.alpha = 1.f;
        
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:YES];
        
    }];
    
}

@end
