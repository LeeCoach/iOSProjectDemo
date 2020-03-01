//
//  UIView+DRCornerShadow.m
//  iOSProject
//
//  Created by Coach on 2019/5/7.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "UIView+DRCornerShadow.h"

@implementation UIView (DRCornerShadow)

#pragma mark - 圆角

- (void)dr_setCornerRadius:(CGFloat)cornerRadius
{
    
    [self addSetCornerRadius:cornerRadius roundingCorners:UIRectCornerAllCorners borderWidth:0 borderColor:nil shadowOffset:CGSizeZero shadowRadius:0 shadowColor:nil shadowOpacity:0];
}

- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
{
    
    [self addSetCornerRadius:cornerRadius roundingCorners:corners borderWidth:0 borderColor:nil shadowOffset:CGSizeZero shadowRadius:0 shadowColor:nil shadowOpacity:0];
}


#pragma mark - 圆角边框
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
               borderWidth:(CGFloat)borderWidth
               borderColor:(UIColor *)borderColor
{
    
    [self addSetCornerRadius:cornerRadius roundingCorners:corners borderWidth:borderWidth borderColor:borderColor shadowOffset:CGSizeZero shadowRadius:0 shadowColor:nil shadowOpacity:0];
}


#pragma mark - 阴影
- (void)dr_setShadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
{
    
    [self addSetCornerRadius:radius roundingCorners:UIRectCornerAllCorners borderWidth:0 borderColor:nil shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:0];
}

- (void)dr_setShadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity
{
    
    [self addSetCornerRadius:radius roundingCorners:UIRectCornerAllCorners borderWidth:0 borderColor:nil shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
}


#pragma mark - 绘制阴影+圆角
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity
{
    [self addSetCornerRadius:cornerRadius roundingCorners:UIRectCornerAllCorners borderWidth:0 borderColor:nil shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
    
}

- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity
{
    
    [self addSetCornerRadius:cornerRadius roundingCorners:corners borderWidth:0 borderColor:nil shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
}


#pragma mark - 边框
- (void)dr_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor
{
    [self addSetCornerRadius:0 roundingCorners:UIRectCornerAllCorners borderWidth:borderWidth borderColor:borderColor shadowOffset:CGSizeZero shadowRadius:0 shadowColor:nil shadowOpacity:0];
}

#pragma mark - 绘制阴影+边框
- (void)dr_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor
             shadowOffset:(CGSize)offset
             shadowRadius:(CGFloat)radius
              shadowColor:(UIColor *)color
            shadowOpacity:(CGFloat)opacity
{
    [self addSetCornerRadius:radius roundingCorners:UIRectCornerAllCorners borderWidth:borderWidth borderColor:borderColor shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
}

#pragma mark - 绘制阴影+圆角+边框
- (void)dr_setCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
               borderWidth:(CGFloat)borderWidth
               borderColor:(UIColor *)borderColor
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity
{
    
    [self addSetCornerRadius:cornerRadius roundingCorners:corners borderWidth:borderWidth borderColor:borderColor shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
}


#pragma mark - public
#pragma mark - 设置圆角+边框+阴影
- (void)addSetCornerRadius:(CGFloat)cornerRadius
           roundingCorners:(UIRectCorner)corners
               borderWidth:(CGFloat)borderWidth
               borderColor:(UIColor *)borderColor
              shadowOffset:(CGSize)offset
              shadowRadius:(CGFloat)radius
               shadowColor:(UIColor *)color
             shadowOpacity:(CGFloat)opacity
{
    // 使用Masonry布局后，view的bounds是异步返回的，这里需要做初步的判断
    if (self.bounds.size.width != 0 && self.bounds.size.height != 0) {
        if (opacity > 0 && cornerRadius > 0) {
            
            // view (阴影视图)
            
            UIView *view = [self.superview viewWithTag:996];
            if (!view) {
                view = [[UIView alloc] initWithFrame:self.frame];
                view.tag = 996;
                view.backgroundColor = [UIColor clearColor];
                [self.superview insertSubview:view belowSubview:self];
            }
            [self addShadow:view cornerRadius:cornerRadius roundingCorners:corners shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
            
        } else {
            [self addShadow:self cornerRadius:cornerRadius roundingCorners:corners shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
        }
        
        if ((cornerRadius > 0 && corners != UIRectCornerAllCorners) || opacity > 0) {
            // 圆角和边框的贝塞尔曲线
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            // 圆角
            if (cornerRadius > 0) {
                CAShapeLayer *maskLayer = [CAShapeLayer layer];
                maskLayer.frame = self.bounds;
                maskLayer.path = path.CGPath;
                self.layer.mask = maskLayer;
            }
            // 边框
            if (borderWidth > 0) {
                CAShapeLayer *layer = [[CAShapeLayer alloc]init];
                layer.frame = self.bounds;
                layer.path = path.CGPath;
                layer.lineWidth = borderWidth;
                layer.strokeColor = borderColor.CGColor;
                layer.fillColor = [UIColor clearColor].CGColor;
                [self.layer addSublayer:layer];
            }
        } else {
            // 没有圆角时，直接添加边框
            self.layer.masksToBounds = true;
            self.layer.cornerRadius = cornerRadius;
            self.layer.borderWidth = borderWidth;
            self.layer.borderColor = borderColor.CGColor;
        }
    } else {// 如果没有获取到view的bounds时
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addSetCornerRadius:cornerRadius roundingCorners:corners borderWidth:borderWidth borderColor:borderColor shadowOffset:offset shadowRadius:radius shadowColor:color shadowOpacity:opacity];
        });
    }
    
}

//添加阴影
- (void)addShadow:(UIView *)view
     cornerRadius:(CGFloat)cornerRadius
  roundingCorners:(UIRectCorner)corners
     shadowOffset:(CGSize)offset
     shadowRadius:(CGFloat)radius
      shadowColor:(UIColor *)color
    shadowOpacity:(CGFloat)opacity {
    
    if (cornerRadius > 0) {
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        view.layer.shadowPath = shadowPath.CGPath;
    }
    view.layer.masksToBounds = NO;
    view.layer.shadowOpacity = opacity;
    view.layer.shadowRadius = radius;
    view.layer.shadowOffset = offset;
    view.layer.shadowColor  = color.CGColor;
}

@end
