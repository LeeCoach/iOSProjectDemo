//
//  NSString+DRPinYin.m
//  gxsz
//
//  Created by 李家二少 on 2019/5/27.
//  Copyright © 2019 GXSZ. All rights reserved.
//

#import "NSString+DRPinYin.h"

@implementation NSString (DRPinYin)

- (NSString *)pinyin
{
    NSMutableString *preString = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformStripDiacritics, NO);
    if ([[self substringToIndex:1] compare:@"长"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chang"];
    }
    else if ([[self substringToIndex:1] compare:@"佛"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 2) withString:@"fo"];
    }
    else if ([[self substringToIndex:1] compare:@"沈"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 4) withString:@"shen"];
    }
    else if ([[self substringToIndex:1] compare:@"厦"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 3) withString:@"xia"];
    }
    else if ([[self substringToIndex:1] compare:@"地"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 2) withString:@"di"];
    }
    else if ([[self substringToIndex:1] compare:@"重"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chong"];
    }
    return preString;
}

@end
