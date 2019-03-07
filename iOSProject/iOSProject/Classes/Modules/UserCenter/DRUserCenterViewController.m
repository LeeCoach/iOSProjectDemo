//
//  DRUserCenterViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRUserCenterViewController.h"

@interface DRUserCenterViewController ()

@end

@implementation DRUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationBarItem];
}

- (void)setNavigationBarItem
{
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"设置" forState:UIControlStateNormal];
    [addBtn setTitleColor:DRHexColor(0x333333) forState:UIControlStateNormal];
    addBtn.titleLabel.font = DRFONT(14);
    [addBtn addTarget:self action:@selector(setUpBotton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
}

- (void)setUpBotton {
    
}



@end
