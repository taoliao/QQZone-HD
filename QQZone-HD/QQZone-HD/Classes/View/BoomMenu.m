//
//  BoomMenu.m
//  QQZone-HD
//
//  Created by corepress on 2018/7/30.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "BoomMenu.h"

@implementation BoomMenu

- (void)rotateToLandscape:(BOOL)isLandscape {
    
    self.width = self.superview.width;
    self.height = isLandscape?kBoomMenuItemWidth:3*kBoomMenuItemWidth;
    self.y = self.superview.height - self.height;
    
    for (UIView *subViews in self.subviews) {
        [subViews removeFromSuperview];
    }
    [self setupItemButtons:isLandscape];
}
- (void)setupItemButtons:(BOOL)isLandscape {
    
    NSArray *imageArr = @[@"tabbar_mood",@"tabbar_photo",@"tabbar_blog"];

    
    for (int i=0;  i<imageArr.count;  i++) {
        
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        [item setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        item.tag = i;
        if (isLandscape) {
            item.x = i*(self.width/3);
            item.width = self.width/3;
            item.height = kBoomMenuItemWidth;
        }else {
            item.y = i*(self.height/3);
            item.width = self.width;
            item.height = (self.height/3);
        }
        [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
        [self addSubview:item];
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        
    }
    
}

- (void)itemClick:(UIButton *)item {
//    [[NSNotificationCenter defaultCenter]postNotificationName:kBoomMenuClickNoti object:item];
    if ([self.delegate respondsToSelector:@selector(menu:andBoomMenutype:)]) {
        [self.delegate menu:self andBoomMenutype:(int)item.tag];
    }
}

@end
