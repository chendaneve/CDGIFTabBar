//
//  CDTabBarController.m
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "CDTabBarController.h"
#import "CDTabBarItem.h"
#import "CDTabBar.h"
#import "CDTabBarConfig.h"
#import "Common.h"


@interface CDTabBarController () <CDTabBarDelegate>

@property (nonatomic, strong) CDTabBar *customTabBar;
@property (nonatomic, strong) CDTabBarConfig *config;

@end

@implementation CDTabBarController

- (CDTabBar *)customTabBar {
    if (!_customTabBar) {
        _customTabBar = [[CDTabBar alloc] init];
        _customTabBar.delegate = self;
    }
    return _customTabBar;
}

+ (instancetype)createTabBarController:(tabBarBlock)block {
    static dispatch_once_t onceToken;
    static CDTabBarController *tabBar;
    dispatch_once(&onceToken, ^{
        
        tabBar = [[CDTabBarController alloc] initWithBlock:block];
    });
    
    return tabBar;
}

+ (instancetype)defaultTabBarController {
    
    return [CDTabBarController createTabBarController:nil];
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed {
    self.customTabBar.hidden = hidesBottomBarWhenPushed;
    self.tabBar.hidden = YES;
}

- (void)hiddenTabBarWithAnimation:(BOOL)isAnimation {
    
    if (isAnimation) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.customTabBar.alpha = 0;
        }];
    } else {
        
        self.customTabBar.alpha = 0;
    }
}

- (void)showTabBarWithAnimation:(BOOL)isAnimation {
    
    if (isAnimation) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.customTabBar.alpha = 1.0;
        }];
    } else {
        
        self.customTabBar.alpha = 1.0;
    }
}

- (instancetype)initWithBlock:(tabBarBlock)block {
    
    self = [super init];
    if (self) {
        
        CDTabBarConfig *config = [[CDTabBarConfig alloc]init];
        
        NSAssert(block, @"Param in zhe function, can not be nil");
        if (block) {
            
            _config = block(config);
        }
        
        NSAssert(_config.viewControllers, @"Param 'viewControllers' in the 'config', can not be nil");
        [self setupViewControllers];
        [self setupTabBar];
        
        _isAutoRotation = YES;
    }
    
    return self;
}

- (void)setupViewControllers {
    
    if (_config.isNavigation) {
        
        NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:_config.viewControllers.count];
        for (UIViewController *vc in _config.viewControllers) {
            if (![vc isKindOfClass:[UINavigationController class]]) {
                UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
                [vcs addObject:nav];
            } else {
                [vcs addObject:vc];
            }
        }
        
        self.viewControllers = [vcs copy];
    } else {
        
        self.viewControllers = [_config.viewControllers copy];
    }
}

- (void)setupTabBar {
    
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < _config.viewControllers.count; i++) {
        CDTabBarItem *item = [[CDTabBarItem alloc] init];
        
        if (i == 0) {
            if (_config.selectedImages.count > i) {
                item.icon = _config.selectedImages[i];
            }
            else {
                item.icon = _config.normalImages[i];
            }
            if (_config.titles.count > 0) {
                item.titleColor = _config.selectedColor;
            }
            item.isSelected = YES;
        } else {
            
            item.icon = _config.normalImages[i];
            if (_config.titles.count > 0) {
                
                item.titleColor = _config.normalColor;
            }
            
        }
        if (i < _config.titles.count) {
            
            item.title = _config.titles[i];
        }
        
        [items addObject:item];
        item.tag = i;
    }
    // 隐藏掉系统的tabBar
    self.tabBar.hidden = YES;
    self.customTabBar.cdItems = [items copy];
    self.customTabBar.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - cdTabBarHeight, CGRectGetWidth(self.view.frame), cdTabBarHeight);
    self.customTabBar.cdDelegate = self;
    [self.view addSubview:self.customTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.selectedIndex = 0;
}

#pragma mark - LZTabBarDelegate
- (void)tabBar:(CDTabBar *)tab didSelectItem:(CDTabBarItem *)item atIndex:(NSInteger)index {
    
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];
    for (UIView *view in tab.subviews) {
        if ([view isKindOfClass:[CDTabBarItem class]]) {
            
            [items addObject:view];
        }
    }
    
    for (int i = 0; i < items.count; i++) {
        
        UIView *view = items[i];
        if ([view isKindOfClass:[CDTabBarItem class]]) {
            CDTabBarItem *item = (CDTabBarItem *)view;
            item.isSelected = NO;
            item.icon = self.config.normalImages[i];
            if (self.config.titles.count > 0) {
                
                item.titleColor = _config.normalColor;
            }
        }
    }
    
    item.isSelected = YES;
    if (self.config.selectedImages.count > index) {
        item.icon = self.config.selectedImages[index];
    }
    else {
        item.icon = self.config.normalImages[index];
    }
    
    if (self.config.titles.count > 0) {
        item.titleColor = self.config.selectedColor;
    }
    
    self.selectedIndex = index;
}

// 屏幕旋转时调整tabbar
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    self.customTabBar.frame = CGRectMake(0, size.height - cdTabBarHeight, size.width, cdTabBarHeight);
}

- (BOOL)shouldAutorotate {
    
    return self.isAutoRotation;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.isAutoRotation) {
        
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
