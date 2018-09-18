//
//  Tabbar.h
//  QQZone-HD
//
//  Created by corepress on 2018/8/1.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tabbar;
@protocol TabbarDelegate <NSObject>
@optional
- (void)tabbar:(Tabbar *)tabbar selectForm:(NSInteger)from to:(NSInteger)to;

@end

@interface Tabbar : UIView
- (void)rotateToLandscape:(BOOL)isLandscape;

/**/
@property(nonatomic,weak)id <TabbarDelegate>delegate;

- (void)unselected;

@end


@interface TabbarItem:UIButton

@end


