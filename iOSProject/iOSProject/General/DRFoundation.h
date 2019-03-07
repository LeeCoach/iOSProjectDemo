//
//  DRFoundation.h
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#ifndef DRFoundation_h
#define DRFoundation_h

/// 当前版本
#define DRCurrentVersion        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#define DRUserDefaults          [NSUserDefaults standardUserDefaults]
#define DRNotificationCenter    [NSNotificationCenter defaultCenter]


//*********** log打印
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define LTLog(FORMAT, ...) fprintf(stderr,"\n\n\n**********************************************************\n----->>>>>>文件名 : %s\n" "----->>>>>>函数名 : %s  " "\n----->>>>>>行号 : %d行\n----->>>>>>输出 :%s\n",__FILE__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define LTLog(...) {}
#endif


//*********** weakify strongify
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



#endif /* DRFoundation_h */
