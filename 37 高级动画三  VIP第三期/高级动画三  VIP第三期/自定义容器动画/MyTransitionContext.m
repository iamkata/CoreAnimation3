//
//  MyTransitionContext.m
//  高级动画三  VIP第三期
//
//  Created by 徐金城 on 2019/11/13.
//  Copyright © 2019 八点钟学院. All rights reserved.
//

#import "MyTransitionContext.h"

@interface MyTransitionContext()

@property(nonatomic, strong)NSDictionary *viewControllers;
@property(nonatomic, strong)NSDictionary *views;
@property(nonatomic, strong)UIView *containerView;

@end

@implementation MyTransitionContext

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    
    if (self = [super init]) {
        
        _views = @{
                   UITransitionContextToViewKey:toViewController.view,
                   UITransitionContextFromViewKey:fromViewController.view
                   };
        
        _viewControllers = @{
                             UITransitionContextToViewControllerKey:toViewController,
                             UITransitionContextFromViewControllerKey:fromViewController
                             };
        
        //这里获取的就是EOCContainerViewController里面的containerView
        self.containerView = fromViewController.view.superview;
    }
    return self;
}

- (nullable __kindof UIView *)viewForKey:(UITransitionContextViewKey)key {
    
    return _views[key];
    
}

- (nullable __kindof UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key {
    
    return _viewControllers[key];
}

//转场完成
- (void)completeTransition:(BOOL)didComplete {
    [(UIView *)_views[UITransitionContextFromViewKey] removeFromSuperview];
    [(UIViewController *)_viewControllers[UITransitionContextFromViewControllerKey] removeFromParentViewController];
}

@end


