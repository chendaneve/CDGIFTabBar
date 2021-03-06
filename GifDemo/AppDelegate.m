//
//  AppDelegate.m
//  GifDemo
//
//  Created by chendan on 2017/12/11.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "AppDelegate.h"
#import "CDTabBarConfig.h"
#import "CDTabBarController.h"
#import "ViewController.h"

@interface AppDelegate () <UINavigationControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    CDTabBarController *tabController =  [CDTabBarController createTabBarController:^CDTabBarConfig *(CDTabBarConfig *config) {
        
        config.selectedColor = [UIColor redColor];
//        config.normalImages = @[@"ani.gif", @"ani.gif", @"ani.gif"];
        config.normalColor = [UIColor blackColor];
        config.normalImages = @[@"home", @"my", @"service", @"timeline"];
        config.selectedImages = @[@"home.gif", @"my.gif", @"service.gif", @"timeline.gif"];
        config.titles = @[@"111111111", @"23333333322", @"333", @"时间"];
        
        UINavigationController *nv =  [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
        nv.title = @"uyion";
        nv.delegate = self;
        config.viewControllers = @[ [UIViewController new],
                                    nv,
                                    [UIViewController new],
                                    [UIViewController new]
                                ];
        return config;
        
    }];
    
    self.window.rootViewController = tabController;
    
    // Override point for customization after application launch.
    return YES;
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if (navigationController.viewControllers.count > 1) {
        viewController.tabBarController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.tabBarController.hidesBottomBarWhenPushed = NO;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
