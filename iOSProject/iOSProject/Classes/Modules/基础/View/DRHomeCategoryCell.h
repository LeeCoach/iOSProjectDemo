//
//  DRHomeCategoryCell.h
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRHomeItemModel.h" /**<<#des#>*/

NS_ASSUME_NONNULL_BEGIN

@interface DRHomeCategoryCell : UICollectionViewCell

@property (nonatomic, strong) DRHomeItemModel *itemModel;

@property (nonatomic, copy) void (^selectCategoryBlock)(void);

@end

NS_ASSUME_NONNULL_END
