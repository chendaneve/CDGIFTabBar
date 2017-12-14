//
//  CDTabBarConfig.m
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "CDTabBarConfig.h"

@implementation CDTabBarConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _isNavigation = YES;
        _normalColor = [UIColor grayColor];
        _selectedColor = [UIColor redColor];
    }
    
    return self;
}
@end
