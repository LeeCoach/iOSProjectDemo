//
//  DRNavigationViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRNavigationViewController.h"

@interface DRNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation DRNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    self.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone; //默認是UIRectEdgeAll，即上下左右四個方向都會覆蓋，那麼為讓頂部不進行延伸到導航欄覆蓋的區域，我們可以把頂部區域延伸去掉。
    self.extendedLayoutIncludesOpaqueBars = NO;     //设置Y起始位置为导航栏下，当设置为YES时，视图在导航栏层下，状态栏下位置开始
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //隐藏导航栏底线
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
}

// Hook ViewController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        if (self.viewControllers.count == 1) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_nav_left_black"] style:UIBarButtonItemStylePlain target:self action:@selector(popViewController)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController *viewController = nil;
    
    if (self.viewControllers.count <= 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        viewController = [super popViewControllerAnimated:animated];
    }
    
    return viewController;
}

- (void)popViewController {
    if (self.viewControllers.count == 1) {
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } else {
        [self popViewControllerAnimated:YES];
    }
}

@end
