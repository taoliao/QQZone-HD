//
//  BoomMenu.h
//  QQZone-HD
//
//  Created by corepress on 2018/7/30.
//  Copyright © 2018年 corepress. All rights reserved.
//
#import <UIKit/UIKit.h>

@class BoomMenu;
@protocol BoomMenuDelegate <NSObject>
@optional
- (void)menu:(BoomMenu *)menu andBoomMenutype:(int)type;
@end

@interface BoomMenu : UIView

- (void)rotateToLandscape:(BOOL)isLandscape;

@property(nonatomic,weak) id <BoomMenuDelegate>delegate;

@end
