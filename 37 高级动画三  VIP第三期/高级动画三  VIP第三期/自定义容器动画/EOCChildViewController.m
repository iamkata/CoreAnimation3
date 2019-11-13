//
//  EOCChildViewController.m
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

#import "EOCChildViewController.h"

@interface EOCChildViewController () {
    
    UIButton *btn;
    
}

@end

@implementation EOCChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100.f, 100.f+100.f, 200.f, 50.f);
    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.backgroundColor = [UIColor clearColor];
    
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)setText:(NSString *)text {
    
    [btn setTitle:text forState:UIControlStateNormal];
    
}

- (void)setBgColor:(UIColor *)bgColor {
    
    self.view.backgroundColor = bgColor;
    
}



@end
