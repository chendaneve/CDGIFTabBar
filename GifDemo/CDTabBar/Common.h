//
//  Common.h
//  GifDemo
//
//  Created by chendan on 2017/12/14.
//  Copyright © 2017年 chendan. All rights reserved.
//

#ifndef Common_h
#define Common_h


#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define cdTabBarHeight (kDevice_Is_iPhoneX ? 83.0 : 49.0)
#define cdTabBarItemHeight 49.0

#define cdTabBarItemOffsetHeight 20.0


#endif /* Common_h */
