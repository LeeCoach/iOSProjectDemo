//
//  UIImage+DRExtension.h
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DRExtension)

/**
 *  返回原始图片
 */
+ (nullable UIImage *)imageNamedForOriginal:(nullable NSString *)name;

@end

NS_ASSUME_NONNULL_END
