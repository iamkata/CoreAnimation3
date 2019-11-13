//
//  MyTransitionContext.h
//  高级动画三  VIP第三期
//
//  Created by 徐金城 on 2019/11/13.
//  Copyright © 2019 八点钟学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyTransitionContext : NSObject <UIViewControllerContextTransitioning>

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;

- (void)completeTransition:(BOOL)didComplete;

@end
