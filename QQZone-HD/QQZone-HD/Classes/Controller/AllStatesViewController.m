//
//  AllStatesViewController.m
//  QQZone-HD
//
//  Created by corepress on 2018/8/13.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "AllStatesViewController.h"

@interface AllStatesViewController ()

@end

@implementation AllStatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"特别关心",@"好友动态",@"认证空间"]];

    seg.tintColor = [UIColor lightGrayColor];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:15.0]};
    
    [seg setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    seg.selectedSegmentIndex = 0;
    
    [seg addTarget:self action:@selector(segmentedControlSelectAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = seg;
    
}

- (void)segmentedControlSelectAction:(UISegmentedControl *)seg {
    
    NSLog(@"%ld",seg.selectedSegmentIndex);
    
}



@end
