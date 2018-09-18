//
//  MoodViewController.m
//  QQZone-HD
//
//  Created by corepress on 2018/8/6.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "MoodViewController.h"

@interface MoodViewController ()

@end

@implementation MoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"发表说说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(dissMissAction)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(compseAction)];
    
}

- (void)dissMissAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)compseAction {
    
    
}

@end
