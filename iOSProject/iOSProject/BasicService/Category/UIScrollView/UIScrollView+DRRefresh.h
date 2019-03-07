//
//  UIScrollView+DRRefresh.h
//  iOSProject
//
//  Created by Coach on 2019/3/7.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 此size用于标记请求不需要pageSize
/// 当不需要页码大小时, 可以传入此size
extern char const LTRefreshingNonePageSize;

@class DRRefreshConfig;

@interface UIScrollView (DRRefresh)

@property (class, nonatomic, strong, nullable) DRRefreshConfig *dr_refreshConfig;

/// 只配置Header刷新
/// 该方法只配置 header 刷新(当只有下拉刷新的时候使用)
- (void)dr_setupRefreshingWithRefreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock;

/// 只配置Footer刷新
- (void)dr_setupFooterRefreshingWithPageSize:(short)pageSize
                                beginPageNum:(NSInteger)beginPageNum
                             refreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock;

/// 配置刷新
/// 该方法配置 header 和 footer 刷新
- (void)dr_setupRefreshingWithPageSize:(short)pageSize
                          beginPageNum:(NSInteger)beginPageNum
                       refreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock;

/// 执行 header 刷新
/// - Animated
- (void)dr_exeHeaderRefreshing;
- (void)dr_exeHeaderRefreshingAnimated:(BOOL)animated;

/// 执行 footer 刷新
- (void)dr_exeFooterRefreshing;
/// 结束刷新
/// 传入的count将会与`dr_pageSize`比较, 刷新footer的状态(有无更多数据)
- (void)dr_endRefreshingWithItemCount:(NSUInteger)itemCount;
/// 结束刷新
- (void)dr_endRefreshing;


#pragma mark -
/// 开始页
@property (nonatomic, readonly) NSInteger dr_beginPageNum;
/// 页码的size, 该size用于footer的状态控制.
/// 如果 结束刷新(dr_endRefreshingWithItemCount:)传入的size, 小于该size, 则将footer的状态设置为 noMoreData.
@property (nonatomic, readonly) NSInteger dr_pageSize;
/// 当前页
@property (nonatomic, assign) NSInteger dr_pageNum;

@end

@interface DRRefreshConfig : NSObject

@property (nonatomic, strong, nullable) UIColor *textColor; //字体颜色

#pragma mark header
@property (nonatomic, strong, nullable) UIImage *gifImage_header; //下拉图片

#pragma mark footer
@property (nonatomic, strong, nullable) UIImage *gifImage_footer; //上拉图片
@end

NS_ASSUME_NONNULL_END
