//
//  EOCInteractiveTransition.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//
#import "EOCInteractiveTransition.h"

@interface EOCInteractiveTransition () {
    UIViewController *presentedViewController;
    BOOL shouldComplete; //是否拖拽了一半以上
}

@end

@implementation EOCInteractiveTransition

- (void)transitionToViewController:(UIViewController *)toViewController {
    
    presentedViewController = toViewController;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [toViewController.view addGestureRecognizer:panGesture];
}

- (void)panAction:(UIPanGestureRecognizer *)gesture {
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            
            [presentedViewController dismissViewControllerAnimated:YES completion:nil];
            
            break;
        case UIGestureRecognizerStateChanged: {
            
            //监听当前滑动的距离
            CGPoint transitionPoint = [gesture translationInView:presentedViewController.view];
            NSLog(@"transitionPoint %@", NSStringFromCGPoint(transitionPoint));
            
            CGFloat ratio = transitionPoint.y/[UIScreen mainScreen].bounds.size.height;
            NSLog(@"ratio: %f", ratio);
            
            if (ratio >= 0.5) {
                shouldComplete = YES;
            } else {
                shouldComplete = NO;
            }
            [self updateInteractiveTransition:ratio];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            if (shouldComplete) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}

@end
