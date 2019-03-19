//
//  DRCellConfingModel.m
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import "DRCellConfingModel.h"

@implementation DRCellConfingModel

+ (instancetype)itemWithTitle:(NSString *)title detail:(NSString *)detail
{
    return [self itemWithImageName:nil title:title detail:detail hideLine:YES];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title
{
    return [self itemWithImageName:imageName title:title detail:nil];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail
{
    return [self itemWithImageName:imageName title:title detail:detail hideLine:NO];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail hideLine:(BOOL)hideLine
{
    DRCellConfingModel *model = [[self alloc] init];
    model.imageName = imageName;
    model.titleStr = title;
    model.detailLabelStr = detail;
    model.isHiddenBottomLineView = hideLine;
    
    return model;
}

@end
