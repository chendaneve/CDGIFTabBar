//
//  ViewController.m
//  GifDemo
//
//  Created by chendan on 2017/12/11.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "ViewController.h"
#import <YYImage/YYImage.h>
#import "NextViewController.h"

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
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    btn.backgroundColor = UIColor.redColor;
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
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

- (IBAction)btnClicked:(id)sender {
//    NextViewController *vc = [NextViewController new];
    [self.navigationController pushViewController:[ViewController new] animated:YES];
//    vc.tabBarController.hidesBottomBarWhenPushed = YES;
//    vc.hidesBottomBarWhenPushed = YES;
}


@end
