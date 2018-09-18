//
//  LoginViewController.m
//  QQZone-HD
//
//  Created by corepress on 2018/7/27.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *showactivity;
@property (weak, nonatomic) IBOutlet UIButton *remPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)logInAction:(UIButton *)sender {
    NSString *account = self.accountTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [self.showactivity startAnimating];
    if (account.length == 0 || password.length == 0) {
        [self showError:@"账号密码不能为空!"];
        return;
    }
    self.view.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([account isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
             self.view.userInteractionEnabled = YES;
             [self.showactivity stopAnimating];
            [UIApplication sharedApplication].keyWindow.rootViewController = [[HomeViewController alloc] init];
            
        }else {
            [self showError:@"账号密码错误"];
            return ;
        }
    });

}
- (IBAction)remPasswordAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (!sender.selected) {
        self.autoLoginBtn.selected = NO;
    }
}
- (IBAction)autoLoginAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.remPasswordBtn.selected = YES;
    }
}

- (void)showError:(NSString *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:error preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.values = @[@-10,@0,@10,@0];
    shake.duration = 0.1;
    shake.repeatCount = 3;
    [self.loginView.layer addAnimation:shake forKey:nil];
    
    self.view.userInteractionEnabled = YES;
     [self.showactivity stopAnimating];
}
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.accountTextField) {
        [self.passwordTextField becomeFirstResponder];
    }else if (textField == self.passwordTextField) {
        [self logInAction:nil];
    }
    
    return YES;
}

@end
