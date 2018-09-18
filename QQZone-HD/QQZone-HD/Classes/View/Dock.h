//
//  Dock.h
//  QQZone-HD
//
//  Created by corepress on 2018/7/27.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BoomMenu,Tabbar,IconButton;
@interface Dock : UIView

@property(nonatomic,strong) BoomMenu *boomMenu;
@property(nonatomic,strong) Tabbar *tb;
@property(nonatomic,strong) IconButton *ib;
-(void)rotateToLandscape:(BOOL)isLandscape; //判断屏幕方向

@end
