//
//  AppDelegate.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "DRTabBarController.h" /**<<#des#>*/
#import "DRGuidePageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = DRHexColor(0xffffff);
    
    //判断当前版本与u最后安装的版本相同，则非第一次进入
    if ([DRCurrentVersion isEqualToString:[DRUserDefaults objectForKey:DRLastVersion]]) {
        [self setRootEntrance];
    } else {
        DRGuidePageViewController *vc  = [[DRGuidePageViewController alloc] init];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
        // 保存最后安装版本
        [DRUserDefaults setObject:DRCurrentVersion forKey:DRLastVersion];
    }
    return YES;
}

- (void)setRootEntrance
{
    DRTabBarController *tab = [[DRTabBarController alloc] init];
    [self.window setRootViewController:tab];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
