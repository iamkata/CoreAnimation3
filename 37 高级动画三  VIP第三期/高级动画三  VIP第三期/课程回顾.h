//
//  课程回顾.h
//  高级动画三  VIP第三期
//
//  Created by 八点钟学院 on 2018/5/9.
//  Copyright © 2018年 八点钟学院. All rights reserved.
//

1、presentViewController的自定义动画，关键是实现代理方法，以及实现动画对象
2、dismissViewController的时候，和1是一样的：fromView和toView的层次关系，因为你是对fromView进行操作，如果此时toView的层次在最上层，会没有动画效果
3、交互式动画：手势state为changed的时候，没有updateTransition，所以课堂中导致了问题
4、结合1、2、3  做自定义容器的动画：类似UINavigationController、UITabBarViewController的容器动画


这个课程主要是viewController之间的切换：容器里ViewController的切换：永远只有一个ViewController
