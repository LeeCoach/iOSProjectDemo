//
//  UIImage+DRExtension.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "UIImage+DRExtension.h"

@implementation UIImage (DRExtension)

/**
 *  返回原始图片
 */
+ (nullable UIImage *)imageNamedForOriginal:(nullable NSString *)name
{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
