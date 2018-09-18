//
//  Tabbar.m
//  QQZone-HD
//
//  Created by corepress on 2018/8/1.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "Tabbar.h"
const CGFloat krigaio = 0.4;

@interface Tabbar()
@property(nonatomic,strong)TabbarItem *selectItem;
@end

@implementation Tabbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTabbarItems];
    }
    return self;
}

- (void)rotateToLandscape:(BOOL)isLandscape {
    
    self.width = self.superview.width;
    self.height = 6*kBoomMenuItemWidth;
    [self setupItemButtons:isLandscape];
}

- (void)setupTabbarItems {

    for (int i=0;  i<6;  i++) {
        TabbarItem *item = [TabbarItem buttonWithType:UIButtonTypeCustom];
        item.tag = i;
        [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
        [self addSubview:item];
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
        
    }
}

- (void)setupItemButtons:(BOOL)isLandscape {
    
    NSArray *imageArr = @[@"tab_bar_feed_icon",@"tab_bar_passive_feed_icon",@"tab_bar_pic_wall_icon",@"tab_bar_e_album_icon",@"tab_bar_friend_icon",@"tab_bar_e_more_icon"];
    
    NSArray *titleArr = @[@"全部动态",@"与我相关",@"照片墙  ",@"电子相册",@"好友",@"更多"];
    
    for (int i=0;  i<self.subviews.count;  i++) {
        
        TabbarItem *item = self.subviews[i];
        item.y = i*kBoomMenuItemWidth;
        item.width = self.width;
        item.height = kBoomMenuItemWidth;
        item.tag = i;
        [item setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        if (isLandscape) {
            NSString *title = isLandscape ? titleArr[i]:@"";
            [item setTitle:title forState:UIControlStateNormal];
            item.imageEdgeInsets = UIEdgeInsetsMake(0, -80, 0, 0);
        }
        [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];        
    }
    
}
- (void)itemClick:(TabbarItem *)item {

    if ([self.delegate respondsToSelector:@selector(tabbar:selectForm:to:)]) {
        [self.delegate tabbar:self selectForm:self.selectItem.tag to:item.tag];
    }
    
    self.selectItem.selected = NO;
    self.selectItem = item;
    self.selectItem.selected = YES;
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:kTabbarItemClickNoti object:item];
    
}

- (void)unselected {
    self.selectItem.selected = NO;
}

@end

@implementation TabbarItem
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (self.width == self.height) { //横屏
        return self.bounds;
    }else {
        CGFloat width = self.width*krigaio;
        CGFloat height = self.height;
        CGFloat x = 0;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (self.width == self.height) { //横屏
        return CGRectZero;
    }else {
        CGFloat width = self.width*(1-krigaio);
        CGFloat height = self.height;
        CGFloat x = self.width*krigaio;
        CGFloat y = 0;
        return CGRectMake(x, y, width, height);
    }
}
- (void)setHighlighted:(BOOL)highlighted{}

@end


