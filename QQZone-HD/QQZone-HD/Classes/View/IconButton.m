//
//  IconButton.m
//  QQZone-HD
//
//  Created by corepress on 2018/8/1.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "IconButton.h"

@implementation IconButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"13_5b5e83268fb640"] forState:UIControlStateNormal];
        [self setTitle:@"马哥哥哥" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)rotateToLandscape:(BOOL)isLandscape {
    self.isLandscape = isLandscape;
    self.width = isLandscape?kIconBtnLandScapeWidth : kIconBtnProtraitWidth;
    self.height = isLandscape?kIconBtnLandScapeWidth + kIconBtnTitleHeight : kIconBtnProtraitWidth;
    self.x = (self.superview.width-self.width)*0.5;
    self.y = 40;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (self.isLandscape) { //横屏
        CGFloat width = self.width;
        CGFloat height = width;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
        
    }else {
         return self.bounds;
    }
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (self.isLandscape) { //横屏
        CGFloat width = self.width;
        CGFloat height = kIconBtnTitleHeight;
        CGFloat x = 0;
        CGFloat y = self.height - height;
        return CGRectMake(x, y, width, height);
    }else {
         return CGRectZero;
    }
}

@end
