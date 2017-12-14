//
//  CDTabBarItem.h
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYImage/YYImage.h>

@protocol CDTabBarItemDelegate;

@interface CDTabBarItem : UIView

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) id <CDTabBarItemDelegate> delegate;

- (void)updateFrameWithPointX:(CGFloat)pointX width:(CGFloat)width height:(CGFloat)height;
@end



@protocol CDTabBarItemDelegate <NSObject>

- (void)tabBarItem:(CDTabBarItem *)item didSelectIndex:(NSInteger)index;
@end

