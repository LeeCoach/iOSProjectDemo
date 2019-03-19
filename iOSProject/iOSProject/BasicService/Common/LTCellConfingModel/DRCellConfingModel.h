//
//  DRCellConfingModel.h
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRCellConfingModel : NSObject

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSString *cellClassName;  //类名

@property (nonatomic, strong) NSString *imageName;  //图片
@property (nonatomic, strong) NSString *titleStr;   //标题
@property (nonatomic, strong) NSString *placeholderStr;
@property (nonatomic, strong) NSString *detailLabelStr; //详情
@property (nonatomic, strong) UIColor *detailLabelStrColor;
@property (nonatomic, assign) CGFloat detailLabelFontSize;
@property (nonatomic, assign) BOOL isHiddenBottomLineView;   //默认不隐藏
@property (nonatomic, assign) BOOL showNextIcon;  //是否显示右指示,默认NO
@property (nonatomic, assign) BOOL isSelect;    //是否选中，默认NO

@property (nonatomic, strong) id data;
@property (nonatomic, weak) id delegate;
@property (nonatomic, copy) void (^cellCallBlock)(void);


+ (instancetype)itemWithTitle:(NSString *)title detail:(NSString *)detail;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title detail:(NSString *)detail;

@end

NS_ASSUME_NONNULL_END
