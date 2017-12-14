//
//  ViewController.m
//  GifDemo
//
//  Created by chendan on 2017/12/11.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "ViewController.h"
#import <YYImage/YYImage.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITabBarItem *gifTabBarItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 文件: ani@3x.gif
//    UIImage *image = [YYImage imageNamed:@"ani.gif"];
//    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
//    [self.view addSubview:imageView];
    UIImageView *image2View = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ani.gif"]];
    [self.view addSubview:image2View];
    
//    self.gifTabBarItem.selectedImage = image;
//    self.gifTabBarItem.image = image;
    [self.gifTabBarItem setImage:[UIImage imageNamed:@"ani.gif"]];
//    self.gifTabBarItem ;
//    self.gifTabBarItem.title = @"陈丹";
//    self.gifTabBarItem
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
