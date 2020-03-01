//
//  UIView+DRCornerShadow.h
//  iOSProject
//
//  Created by Coach on 2019/5/7.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DRCornerShadow)

#pragma mark - 圆角
/**
 绘制圆角(全角) --- 圆角半径
 
 @param cornerRadius 圆角半径
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius;


/**
 绘制圆角 --- 圆角半径、圆角集
 
 @param cornerRadius 圆角半径
 @param corners 圆角集
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners;


#pragma mark - 圆角边框

/**
 绘制圆角+边框  --- 圆角半径、圆角集、边框宽度、边框色
 
 @param cornerRadius 圆角半径
 @param corners 圆角集
 @param borderWidth 边框宽度
 @param borderColor 边框色
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
               borderWidth:(CGFloat)borderWidth
               borderColor:(UIColor *)borderColor;


#pragma mark - 阴影

/**
 绘制阴影 --- 阴影范围,阴影半径,阴影颜色、阴影透明度(默认为1)
 
 
 @param offset 阴影范围
 @param radius 阴影半径
 @param color 阴影颜色
 */
- (void)dr_setShadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color;

/**
 绘制阴影 --- 阴影范围、阴影半径、阴影颜色、阴影透明度
 
 
 @param offset 阴影范围
 @param radius 阴影半径
 @param color 阴影颜色
 @param opacity 阴影透明度
 */
- (void)dr_setShadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity;

#pragma mark - 绘制阴影+圆角
/**
 绘制阴影+圆角(全角) --- 圆角半径、阴影范围、阴影半径、阴影颜色、阴影透明度
 
 
 @param cornerRadius 圆角半径
 @param offset 阴影范围
 @param color 阴影颜色
 @param opacity 阴影透明度
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity;

/**
 绘制阴影+圆角 --- 圆角半径、圆角集、阴影范围、阴影半径、阴影颜色、阴影透明度
 
 
 @param cornerRadius 圆角半径
 @param corners 圆角集
 @param offset 阴影范围
 @param color 阴影颜色
 @param opacity 阴影透明度
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity;

#pragma mark - 边框
/**
 绘制边框 -- 边框宽度、边框颜色
 
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 */
- (void)dr_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor;

#pragma mark - 绘制阴影+边框

/**
 绘制阴影+边框 --- 边框宽度、边框色、阴影范围、阴影半径、阴影颜色、阴影透明度
 
 
 @param borderWidth 边框宽度
 @param borderColor 边框色
 @param offset 阴影范围
 @param radius 阴影半径
 @param color 阴影颜色
 @param opacity 阴影透明度
 */
- (void)dr_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor
             shadowOffset:(CGSize)offset
             shadowRadius:(CGFloat)radius
              shadowColor:(UIColor *)color
            shadowOpacity:(CGFloat)opacity;

#pragma mark - 绘制阴影+圆角+边框
/**
 绘制阴影+圆角+边框 --- 圆角半径、圆角集、边框宽度、边框色、阴影范围、阴影半径、阴影颜色、阴影透明度
 
 
 @param cornerRadius 圆角半径
 @param corners 圆角集
 @param borderWidth 边框宽度
 @param borderColor 边框色
 @param offset 阴影范围
 @param radius 阴影半径
 @param color 阴影颜色
 @param opacity 阴影透明度
 */
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
               borderWidth:(CGFloat)borderWidth
               borderColor:(UIColor *)borderColor
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity;

@end

NS_ASSUME_NONNULL_END
