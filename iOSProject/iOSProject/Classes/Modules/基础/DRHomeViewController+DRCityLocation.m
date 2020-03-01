//
//  DRHomeViewController+DRCityLocation.m
//  iOSProject
//
//  Created by Coach on 2019/7/9.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRHomeViewController+DRCityLocation.h"

#import "DRCityListViewController.h"

@implementation DRHomeViewController (DRCityLocation)
    
- (UIButton *)cityChooseButton
    {
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DRWIDTH(65), 40)];
        UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        cityBtn.frame = leftView.bounds;
        [cityBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -3, 0, 3)];
        //    [cityBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
        cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        cityBtn.titleLabel.font = DRFONT(14);
        cityBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [cityBtn addTarget:self action:@selector(chooseCity)
          forControlEvents:UIControlEventTouchUpInside];
        [leftView addSubview:cityBtn];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
        self.navigationItem.leftBarButtonItem = leftItem;
        return cityBtn;
    }
    
- (void)chooseCity
    {
        DRCityListViewController *vc  = [[DRCityListViewController alloc] init];
                                         
        [self.navigationController pushViewController:vc animated:YES];
    }

@end
