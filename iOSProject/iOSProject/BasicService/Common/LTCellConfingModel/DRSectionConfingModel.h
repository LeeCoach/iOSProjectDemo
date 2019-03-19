//
//  DRSectionConfingModel.h
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRSectionConfingModel : NSObject

@property (nonatomic, strong) NSString *sectionHeadTitle;   //头部标题
@property (nonatomic, strong) NSString *sectionFootTitle;   //尾部标题
@property (nonatomic, assign) CGFloat sectionHeadHeight;    //头部高度 默认为0
@property (nonatomic, assign) CGFloat sectionFootHeight;    //尾部高度 默认为0
@property (nonatomic, strong) NSArray *sectionItems;        //模型数组
@property (nonatomic, strong) NSArray <NSString *>*valueInfos;          //

@end

NS_ASSUME_NONNULL_END
