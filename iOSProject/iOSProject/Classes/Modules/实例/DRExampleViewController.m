//
//  DRExampleViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRExampleViewController.h"

@interface DRExampleViewController ()

@end

@implementation DRExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setNavigationBarItem];
}

- (void)setNavigationBarItem
{
    UIButton *commitBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(0, 0, DRWIDTH(40), DRWIDTH(40));
    [commitBtn setImage:[UIImage imageNamed:@"instance_nav_commit"] forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:commitBtn];
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame = CGRectMake(0, 0, DRWIDTH(40), DRWIDTH(40));
    [messageBtn setImage:[UIImage imageNamed:@"instance_nav_message"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:messageBtn];
}

- (void)commitAction
{
    
}

- (void)messageAction
{
    
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
