//
//  CDTabBarItem.m
//  GifDemo
//
//  Created by chendan on 2017/12/12.
//  Copyright © 2017年 chendan. All rights reserved.
//

#import "CDTabBarItem.h"

static NSInteger defaultTag = 100000;


@interface CDTabBarItem ()

//@property(nonatomic, strong) YYAnimatedImageView *selectImageView;

@property (nonatomic, strong)YYAnimatedImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;

@end


@implementation CDTabBarItem


- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClicked:)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}
// 重写setTag方法
- (void)setTag:(NSInteger)tag {
    
    [super setTag:tag + defaultTag];
}

//- (YYAnimatedImageView *)selectImageView {
//    if (_selectImageView == nil) {
//        _selectImageView = [[YYAnimatedImageView alloc]init];
//        [self addSubview:_selectImageView];
//    }
//
//    return _selectImageView;
//}

- (YYAnimatedImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[YYAnimatedImageView alloc]init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageView];
    }
    
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor grayColor];
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (void)setIcon:(NSString *)icon {
    _icon = icon;
    
    [self updateIconImage];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    
    self.titleLabel.textColor = titleColor;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
//    CGRect frameNew = self.frame;
//    frameNew.origin.y = _isSelected ? - 10 : 0;
//    frameNew.size.height = self.superview.frame.size.height + (_isSelected ? 10 : 0);
//    self.frame = frameNew;
    
    CGFloat height = self.superview.frame.size.height;
    [self updateFrameWithPointX:self.frame.origin.x width:self.frame.size.width height:height];
    
    [self updateIconImage];
    
    [self layoutSubviews];
}

- (void)updateFrameWithPointX:(CGFloat)pointX width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(pointX, _isSelected ? - 10 : 0, width, height + (_isSelected ? 10 : 0));
}

- (void)updateIconImage {
    if (self.isSelected) {
        UIImage *image = [YYImage imageNamed:self.icon];
        self.iconImageView.image = image;
    }
    else {
        self.iconImageView.image = [UIImage imageNamed:self.icon];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat space = 4.0;
    
    if (self.icon.length > 0 && self.title.length > 0) {
        CGFloat iconHeight = CGRectGetHeight(self.frame) - space * 3 - 17; //CGRectGetHeight(self.frame) - space * 3)*2/3.0
        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2 * space, iconHeight);
        self.titleLabel.frame = CGRectMake(space, CGRectGetMaxY(self.iconImageView.frame) + space, CGRectGetWidth(self.frame) - 2*space, 17);
    } else if (self.icon.length > 0) {
        
        self.iconImageView.frame = CGRectMake(2, 2, CGRectGetWidth(self.frame) - 4, CGRectGetHeight(self.frame) - 4);
    } else if (self.title.length > 0) {
        
        self.titleLabel.frame = CGRectMake(2, CGRectGetHeight(self.frame) - 22, CGRectGetWidth(self.frame) - 4, 20);
    }
}

- (void)itemClicked:(UITapGestureRecognizer *)tap {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarItem:didSelectIndex:)]) {
        
        [self.delegate tabBarItem:self didSelectIndex:self.tag - defaultTag];
    }
}

@end
