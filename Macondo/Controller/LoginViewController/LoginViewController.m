//
//  LoginViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/9/23.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoginBtnClicked:(UIButton *)sender {
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [UIStoryboard storyboardWithName:@"Main.storyboard" bundle:nil].instantiateInitialViewController;    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
