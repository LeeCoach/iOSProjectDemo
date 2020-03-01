//
//  NSString+DRExtension.m
//  gxsz
//
//  Created by 李家二少 on 2019/5/15.
//  Copyright © 2019 李家二少. All rights reserved.
//

#import "NSString+DRExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (DRExtension)

// 计算尺寸
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

// URL编码
- (NSString *)urlStringEncoding
{
    NSString *escaped_value = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    kCFAllocatorDefault, /* allocator */
                                                                                                    (CFStringRef)self,
                                                                                                    NULL, /* charactersToLeaveUnescaped */
                                                                                                    CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),//(CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                    kCFStringEncodingUTF8));
    
    return escaped_value;
}

- (NSString *)urlStringDecoding
{
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 32位MD5加密
 
 @param key 需要md5加密的字符串.
 @return 返回32位MD5加密后的字符串
 */
+ (nullable NSString *)md5CacheFileNameForKey:(nullable NSString *)key
{
#if DEBUG
    NSAssert(key.length, @"Key cannot be empty!");
#endif
    if (key.length == 0) {
        return @"";
    }
    const char *cStr = [key UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 小数点格式化：最多保留两位小数，小数点后末尾的0不要
 
 @param f 格式的浮点数
 @return 返回格式后的字符串
 */
+ (NSString *)formatFloat:(float)f
{
    if (fmodf(f, 1)==0) {//如果有一位小数点
        return [NSString stringWithFormat:@"%.0f",f];
    } else if (fmodf(f*10, 1)==0) {//如果有两位小数点
        return [NSString stringWithFormat:@"%.1f",f];
    } else {
        return [NSString stringWithFormat:@"%.2f",f];
    }
}

/**
 小数点格式化：最多保留两位小数，小数点后末尾的0不要
 
 @param numberStr 格式的字符串
 @return 返回格式后的字符串
 */
+ (NSString *)formatString:(NSString *)numberStr
{
    if (numberStr.length > 1) {
        
        if ([numberStr componentsSeparatedByString:@"."].count == 2) {
            NSString *last = [numberStr componentsSeparatedByString:@"."].lastObject;
            if ([last isEqualToString:@"00"]) {
                numberStr = [numberStr substringToIndex:numberStr.length - (last.length + 1)];
                return numberStr;
            }else{
                if ([[last substringFromIndex:last.length -1] isEqualToString:@"0"]) {
                    numberStr = [numberStr substringToIndex:numberStr.length - 1];
                    return numberStr;
                }
            }
        }
        return numberStr;
    }else{
        return nil;
    }
}


- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero))
    {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        
        textSize = [self sizeWithAttributes:attributes];
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:size options:option attributes:attributes context:nil];
        
        textSize = rect.size;
    }
    return textSize;
}



@end
