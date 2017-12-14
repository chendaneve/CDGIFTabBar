//
//  CDTabBarController.h
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDTabBarConfig;
typedef CDTabBarConfig*(^tabBarBlock)(CDTabBarConfig *config);

@interface CDTabBarController : UITabBarController

/**
 是否可用自动旋转屏幕
 */
@property (nonatomic, assign) BOOL isAutoRotation;

/**
 创建tabBarController
 
 @param block 配置创建tabBarController所需的参数
 @return 返回tabBarController实例对象
 */
+ (instancetype)createTabBarController:(tabBarBlock)block;

/**
 获取当前的tabBarController实例, 实例创建后可通过此方法获取当前实例
 
 @return 返回tabBarController实例对象
 */
+ (instancetype)defaultTabBarController;

/**
 隐藏底部tabBar的方法
 
 @param isAnimation 是否需要动画
 */
- (void)hiddenTabBarWithAnimation:(BOOL)isAnimation;

/**
 显示底部tabBar的方法
 
 @param isAnimation 是否需要动画
 */
- (void)showTabBarWithAnimation:(BOOL)isAnimation;

@end
