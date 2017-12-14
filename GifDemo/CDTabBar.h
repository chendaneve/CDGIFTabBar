//
//  CDTabBar.h
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDTabBarItem;
@protocol CDTabBarDelegate;

@interface CDTabBar : UITabBar

@property (nonatomic, strong)NSArray<CDTabBarItem *> *cdItems;
@property (nonatomic, assign)id <CDTabBarDelegate> cdDelegate;

@end


@protocol CDTabBarDelegate <NSObject>

- (void)tabBar:(CDTabBar *)tab didSelectItem:(CDTabBarItem *)item atIndex:(NSInteger)index ;

@end
