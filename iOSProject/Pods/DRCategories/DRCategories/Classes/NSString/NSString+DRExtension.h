//
//  NSString+DRExtension.h
//  gxsz
//
//  Created by 李家二少 on 2019/5/15.
//  Copyright © 2019 李家二少. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DRExtension)

/**
 * `计算NSString的尺寸`
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


/**
 *  URL编码
 */
- (NSString *)urlStringEncoding;
/**
 *  URL反编码
 */
- (NSString *)urlStringDecoding;


/**
 32位MD5加密
 
 @param key 需要md5加密的字符串.
 @return 返回32位MD5加密后的字符串
 */
+ (nullable NSString *)md5CacheFileNameForKey:(nullable NSString *)key;


/**
 小数点格式化：最多保留两位小数，小数点后末尾的0不要
 
 @param f 格式的浮点数
 @return 返回格式后的字符串
 */
+ (NSString *)formatFloat:(float)f;

/**
 小数点格式化：最多保留两位小数，小数点后末尾的0不要
 
 @param numberStr 格式的字符串
 @return 返回格式后的字符串
 */
+ (NSString *)formatString:(NSString *)numberStr;

/**
 计算文字大小
 
 @param font 字体
 @param size 计算范围的大小
 @param lineBreakMode lineBreakMode
 @return 计算出来的大小
 */
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;


@end

NS_ASSUME_NONNULL_END
