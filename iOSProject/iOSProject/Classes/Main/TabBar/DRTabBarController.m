//
//  DRTabBarController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRTabBarController.h"
#import "DRNavigationViewController.h" /**<<#des#>*/

#import "DRHomeViewController.h"
#import "DRFunctionViewController.h" /**<<#des#>*/
#import "DRExampleViewController.h" /**<<#des#>*/
#import "DRGraphicsViewController.h" /**<<#des#>*/
#import "DRUserCenterViewController.h" /**<<#des#>*/


static const CGFloat kDRTabBarPositionAdjustment = 2.0;



@implementation DRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.delegate = self;
    
    [self createSubControllers];
    self.tabBar.tintColor = DRHexColor(0xFFE35E); //设置字体颜色
}

#pragma mark - 创建所有根视图
- (void)createSubControllers
{
    DRHomeViewController *home  = [[DRHomeViewController alloc] init];
    [self setupLTChildVC:home title:@"基础" image:@"tab_icon_home_default" selectedImage:@"tab_icon_home_pressed"];
    
    DRFunctionViewController *vip  = [[DRFunctionViewController alloc] init];
    [self setupLTChildVC:vip title:@"功能" image:@"tab_icon_vip_default" selectedImage:@"tab_icon_vip_pressed"];
    
    DRExampleViewController *vc  = [[DRExampleViewController alloc] init];
    [self setupLTChildVC:vc title:@"实例" image:@"tab_icon_example_default" selectedImage:@"tab_icon_example_pressed"];
    
    DRGraphicsViewController *liveVc = [[DRGraphicsViewController alloc] init];
    [self setupLTChildVC:liveVc title:@"图形动画" image:@"tab_icon_live_default" selectedImage:@"tab_icon_live_pressed"];
    
    DRUserCenterViewController *mineVc = [[DRUserCenterViewController alloc] init];
    [self setupLTChildVC:mineVc title:@"分享登录" image:@"tab_icon_wode_default" selectedImage:@"tab_icon_wode_pressed"];
}

- (void)setupLTChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
 
    vc.tabBarItem.image = [UIImage imageNamedForOriginal:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamedForOriginal:selectedImage];
    vc.tabBarItem.tag = self.viewControllers.count;

    if ([title isEqualToString:@"实例"]) {
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, kDRTabBarPositionAdjustment);
    } else {
//        vc.navigationItem.title = title;
        vc.tabBarItem.title = title;
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-kDRTabBarPositionAdjustment, 0, kDRTabBarPositionAdjustment, 0);
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -kDRTabBarPositionAdjustment);
    }
    
    DRNavigationViewController *nav = [[DRNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

@end
