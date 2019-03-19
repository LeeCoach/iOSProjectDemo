//
//  UIFont+DRFont.m
//  iOSProject
//
//  Created by Coach on 2019/2/27.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "UIFont+DRFont.h"

@implementation UIFont (DRFont)

+ (UIFont *)dr_systemFontOfSize:(CGFloat)fontSize
{
    NSString *fontName = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? @"PingFangSC-Regular" : @"HelveticaNeue";
    
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    
    return font;
}

+ (UIFont *)dr_boldSystemFontOfSize:(CGFloat)fontSize
{
    NSString *fontName = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? @"PingFangSC-Medium" : @"HelveticaNeue-Medium";
    
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    
    return font;
}

+ (UIFont *)dr_lightSystemFontOfSize:(CGFloat)fontSize
{
    NSString *fontName = ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? @"PingFangSC-Light" : @"HelveticaNeue-Light";
    
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    
    return font;
}

@end
