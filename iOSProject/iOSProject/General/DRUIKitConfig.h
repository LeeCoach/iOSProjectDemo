//
//  DRUIKitConfig.h
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#ifndef DRUIKitConfig_h
#define DRUIKitConfig_h




#define DRSCREEN_MAX_LENGTH     (MAX(DRSCREEN_WIDTH, DRSCREEN_HEIGHT))
#define DRSCREEN_MIN_LENGTH     (MIN(DRSCREEN_WIDTH, DRSCREEN_HEIGHT))

//*********** screen
#define WIDTH       ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT      ([UIScreen mainScreen].bounds.size.height)
#define DRSCREEN_WIDTH      WIDTH
#define DRSCREEN_HEIGHT     HEIGHT

#define DR_Height_StatusBar     ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define DR_Height_NavBar        ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define DR_Height_TabBar        ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define DR_Height_SAFEAREA_BOTTOM     34.0  ///< 底部安全区域高度

/// 这针对iPhone6为标准适配宽度
#define DRWIDTH(R)      ((R)*(DRSCREEN_WIDTH/375.0))
/// 这针对iPhone6为标准适配高度
#define DRHEIGHT(R)     (IS_IPhoneX_All?R:((R)*(DRSCREEN_HEIGHT/667.0)) )


//*********** UIColor
#define DRHexColor(c)      [UIColor colorWithRed:((float)((c & 0xFF0000) >> 16))/255.0 green:((float)((c & 0xFF00) >> 8))/255.0 blue:((float)(c & 0xFF))/255.0 alpha:1.0]
#define DRHexColor_A(c,a)  [UIColor colorWithRed:((float)((c & 0xFF0000) >> 16))/255.0 green:((float)((c & 0xFF00) >> 8))/255.0 blue:((float)(c & 0xFF))/255.0 alpha:a]

#define DRRGBColor_A(r, g, b,a)     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define DRRGBColor(r, g, b)         DRRGBColor_A(r, g, b, 1.0f)

/// 随机色
#define DRRandomColor       DRRGBColor((arc4random() % 256), (arc4random() % 256), (arc4random() % 256))

//*********** UIFont
#define UIFontSize(size)    [UIFont systemFontOfSize:size]             //系统字体
///针对字体大小适配
/// 最小字体
#define DRFONT_MIN_SIZE     12.5
/// 字体大小转换，<=12的字体不换算
#define DRFONTSIZE(s)       (IS_IPhoneX_All ? s : ((s<DRFONT_MIN_SIZE) ? s :((s)*DRSCREEN_MAX_LENGTH/667.0)))
/// 这针对iPhone6为标准适配
#define DRFONT(s)           [UIFont dr_systemFontOfSize:DRFONTSIZE(s)]
#define DRFONT_BOLD(s)      [UIFont dr_boldSystemFontOfSize:DRFONTSIZE(s)]
#define DRFONT_LIGHT(s)     [UIFont dr_lightSystemFontOfSize:DRFONTSIZE(s)]


//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPhoneX_All ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? YES : NO)
#define IPHONE_XSeries  isIPhoneXSeries()

//内联函数，鉴于iPhone X/XS/XR/XS Max
static inline BOOL isIPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    } else {
        iPhoneXSeries = ((DRSCREEN_WIDTH == 375.f && DRSCREEN_HEIGHT == 812.f)|| (DRSCREEN_WIDTH == 812.f && DRSCREEN_HEIGHT == 375.f) ? YES : NO);
    }
    
    return iPhoneXSeries;
}

#endif /* DRUIKitConfig_h */
