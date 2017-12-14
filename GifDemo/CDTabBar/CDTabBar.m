//
//  CDTabBar.m
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "CDTabBar.h"
#import "CDTabBarItem.h"
#import "Common.h"

@interface CDTabBar ()  <CDTabBarItemDelegate>

@end

@implementation CDTabBar


- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 移除系统的tabBarItem
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *item in self.subviews) {
        if ([item isKindOfClass:class]) {
            [item removeFromSuperview];
        }
    }
    // 设置自定义的tabBarItem
    [self setupItems];
}

- (void)setupItems {
    
    CGFloat width = CGRectGetWidth(self.frame)/self.cdItems.count;
//    CGFloat height = CGRectGetHeight(self.frame);
    
    for (int i = 0; i < self.cdItems.count; i++) {
        
        CDTabBarItem *item = [self.cdItems objectAtIndex:i];
//        item.frame = CGRectMake(i*width, item.isSelected ? - 10 : 0, width, height + (item.isSelected ? 10 : 0));
        [item updateFrameWithPointX:i*width width:width height:cdTabBarItemHeight];
        [self addSubview:item];
        item.delegate = self;
    }
}

- (void)tabBarItem:(CDTabBarItem *)item didSelectIndex:(NSInteger)index {
    
    if (self.cdDelegate && [self.cdDelegate respondsToSelector:@selector(tabBar:didSelectItem:atIndex:)]) {
        
        [self.cdDelegate tabBar:self didSelectItem:item atIndex:index];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    UIView *result = [super hitTest:point withEvent:event];
    // 如果事件发生在 tabbar 里面直接返回
    if (result) {
        return result;
    }
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为 subview 的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在 subView 里就返回
        if (result) {
            return result;
        }
    }
    return nil;
}

@end
