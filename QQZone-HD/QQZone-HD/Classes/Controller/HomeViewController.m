//
//  HomeViewController.m
//  QQZone-HD
//
//  Created by corepress on 2018/7/27.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "HomeViewController.h"
#import "Dock.h"
#import "Tabbar.h"
#import "BoomMenu.h"
#import "MoodViewController.h"
#import "AllStatesViewController.h"
#import "IconButton.h"

@interface HomeViewController ()<BoomMenuDelegate,TabbarDelegate>

@property(nonatomic,strong)Dock *dock;
/**/
@property(nonatomic,assign)NSInteger selectIndex;

@property(nonatomic,strong) UIViewController *toVC;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:55/255.0 blue:55/255.0 alpha:1.0];
    
    [self setUpDock];
    //监听Tabbar点击的通知
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabBarItemClickNoti:) name:kTabbarItemClickNoti object:nil];
    //监听boomMenu点击的通知
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(boomMenuClickNoti:) name:kBoomMenuClickNoti object:nil];
    //监听iconButton点击的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iconBtnClickNoti:) name:kIconButtonClickNoti object:nil];
    
    [self setupViewControllers];
    
    [self changePersonalVC:nil];
    
}

- (void)setupViewControllers {
    
    AllStatesViewController *vc1 = [[AllStatesViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    vc1.title = @"动态";
    [self addChildViewController:nav1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    vc2.title = @"与我相关";
    [self addChildViewController:nav2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    vc3.title = @"图片";
    [self addChildViewController:nav3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor grayColor];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    vc4.title = @"拍摄";
    [self addChildViewController:nav4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor greenColor];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    vc5.title = @"个人中心";
    [self addChildViewController:nav5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor = [UIColor orangeColor];
    UINavigationController *nav6 = [[UINavigationController alloc] initWithRootViewController:vc6];
    vc6.title = @"更多";
    [self addChildViewController:nav6];

    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav7 = [[UINavigationController alloc] initWithRootViewController:vc7];
    vc7.title = @"个人中心";
    [self addChildViewController:nav7];
    
}

- (void)setUpDock {
    
    Dock *dock = [[Dock alloc] init];
    dock.autoresizingMask = UIViewAutoresizingFlexibleHeight; //高度随屏幕拉伸
    BOOL isLandscape = self.view.bounds.size.width > self.view.bounds.size.height; //横屏
    self.dock = dock;
    CGRect frame = dock.frame;
    frame.size.width = isLandscape?270:70;
    frame.size.height = self.view.bounds.size.height;
    dock.frame = frame;
    [self.view addSubview:dock];
    [self.dock rotateToLandscape:isLandscape];
    
    self.dock.boomMenu.delegate = self;
    self.dock.tb.delegate = self;
    
    [self.dock.ib addTarget:self action:@selector(changePersonalVC:) forControlEvents:UIControlEventTouchDown];
    
}
//监听屏幕的旋转
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    BOOL isLandscape = size.width > size.height; //横屏
    
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
         [self.dock rotateToLandscape:isLandscape];
          self.toVC.view.x = self.dock.width;
    }];
    
}
#pragma mark :tabBarItemClick
- (void)tabbar:(Tabbar *)tabbar selectForm:(NSInteger)from to:(NSInteger)to {
    
    //移除之前的view
     UIViewController *fromVC = self.childViewControllers[from];
     [fromVC.view removeFromSuperview];
    
    //将点击VC的View添加到当前显示的控制器
    UIViewController *toVC = self.childViewControllers[to];
    toVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:toVC.view];
    self.toVC = toVC;
    
    toVC.view.x = self.dock.width;
    toVC.view.y = 20;
    toVC.view.height = self.view.height - 20;
    
    CGFloat protraitWidth = MIN(self.view.width, self.view.height);
    CGFloat contentWidth = protraitWidth - kDockProtraitWidth;
    toVC.view.width = contentWidth;
    
    //记录当前显示的控制器的View的Index
    self.selectIndex = to;
}

#pragma mark IconButtonClick
- (void)changePersonalVC:(IconButton *)btn {
    
    //移除之前显示的View
     UIViewController *selectVC = self.childViewControllers[self.selectIndex];
    
     [selectVC.view removeFromSuperview];
    
     [self tabbar:nil selectForm:self.selectIndex to:self.childViewControllers.count - 1];
    
    //取消tabbar的选中
     [self.dock.tb unselected];
    
}
#pragma mark :boomMenuClick
- (void)menu:(BoomMenu *)menu andBoomMenutype:(int)type {
    switch (type) {
        case 0:
        {
            MoodViewController *moodVC = [[MoodViewController alloc] init];
            UINavigationController *naviMoodVC = [[UINavigationController alloc] initWithRootViewController:moodVC];
            naviMoodVC.modalPresentationStyle = UIModalPresentationFormSheet;
            naviMoodVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:naviMoodVC animated:YES completion:nil];
            
        }
            break;
        case 1:
            NSLog(@"发表图片");
            break;
        case 2:
            NSLog(@"发表日志");
            break;
        default:
            break;
    }
    
}
#pragma mark :iconBtnClick
- (void)iconBtnClickNoti:(NSNotification *)noti {
    UIButton *item = noti.object;
    
    NSLog(@"%ld",item.tag);
}

@end
