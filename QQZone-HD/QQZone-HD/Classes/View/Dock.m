//
//  Dock.m
//  QQZone-HD
//
//  Created by corepress on 2018/7/27.
//  Copyright © 2018年 corepress. All rights reserved.
//


#import "Dock.h"
#import "BoomMenu.h"
#import "Tabbar.h"
#import "IconButton.h"

@interface Dock()

@end

@implementation Dock

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupBoomMenu];
        [self setupTabbar];
        [self setupIconBtn];
    }
    return self;
}

- (void)setupIconBtn {
    IconButton *ib = [[IconButton alloc] init];
    [self addSubview:ib];
    self.ib = ib;
    [ib addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchDown];
}

- (void)setupTabbar {
    Tabbar *tb = [[Tabbar alloc] init];
    [self addSubview:tb];
    self.tb = tb;
    self.tb.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}

- (void)setupBoomMenu {
    
    BoomMenu *menu = [[BoomMenu alloc] init];
    self.boomMenu = menu;
    menu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:menu];
    
}
- (void)rotateToLandscape:(BOOL)isLandscape {
       self.width = isLandscape?kDockLandScapeWidth:kDockProtraitWidth;
      [self.boomMenu rotateToLandscape:isLandscape];
      [self.tb rotateToLandscape:isLandscape];
       self.tb.y = self.height - self.tb.height - self.boomMenu.height;
      [self.ib rotateToLandscape:isLandscape];
}

- (void)iconBtnClick:(UIButton *)ib {
    [[NSNotificationCenter defaultCenter] postNotificationName:kIconButtonClickNoti object:self.ib];
}

@end
