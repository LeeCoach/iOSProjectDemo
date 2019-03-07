//
//  DRHomeCollectionViewCell.h
//  iOSProject
//
//  Created by Coach on 2019/3/6.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRHomeItemModel.h" /**<<#des#>*/

NS_ASSUME_NONNULL_BEGIN

@interface DRHomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) DRHomeItemModel *itemModel;

@end

NS_ASSUME_NONNULL_END
