//
//  IconButton.h
//  QQZone-HD
//
//  Created by corepress on 2018/8/1.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IconButton : UIButton
- (void)rotateToLandscape:(BOOL)isLandscape;
/**/
@property(nonatomic,assign)BOOL isLandscape;
@end
