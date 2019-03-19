//
//  DRHomeCategoryReusableView.h
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^moreBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface DRHomeCategoryReusableView : UICollectionReusableView

/**
 初始化设置
 
 @param title 标题
 @param more 更多按钮
 @param block 按钮事件回调
 */
- (void)setTitle:(NSString *)title moreTitle:(NSString *)more moreBlock:(moreBlock)block;

@end

NS_ASSUME_NONNULL_END
