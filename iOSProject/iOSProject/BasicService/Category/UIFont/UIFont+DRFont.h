//
//  UIFont+DRFont.h
//  iOSProject
//
//  Created by Coach on 2019/2/27.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (DRFont)

+ (UIFont *)dr_systemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)dr_boldSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)dr_lightSystemFontOfSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
