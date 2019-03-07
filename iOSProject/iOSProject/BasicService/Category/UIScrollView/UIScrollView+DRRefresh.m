//
//  UIScrollView+DRRefresh.m
//  iOSProject
//
//  Created by Coach on 2019/3/7.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "UIScrollView+DRRefresh.h"

char const LTRefreshingNonePageSize = -1;

@interface DRRefreshConfig()
- (void)configHeader:(MJRefreshGifHeader *)header;
- (void)configFooter:(MJRefreshAutoGifFooter *)footer;
@end

@implementation DRRefreshConfig
- (void)configHeader:(MJRefreshGifHeader *)header {
    header.gifView.image = self.gifImage_header;
    if ( self.textColor ) {
        header.stateLabel.textColor = self.textColor;
        header.lastUpdatedTimeLabel.textColor = self.textColor;
    }
}
- (void)configFooter:(MJRefreshAutoGifFooter *)footer {
    footer.gifView.image = self.gifImage_footer;
    if ( self.textColor ) footer.stateLabel.textColor = self.textColor;
}
@end

@implementation UIScrollView (DRRefresh)

+ (void)setDr_refreshConfig:(nullable DRRefreshConfig *)dr_refreshConfig {
    objc_setAssociatedObject(self, @selector(dr_refreshConfig), dr_refreshConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (nullable DRRefreshConfig *)dr_refreshConfig {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)dr_setupRefreshingWithRefreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock {
    [self _dr_setupRefreshingWithEnableHeader:YES enableFooter:NO pageSize:LTRefreshingNonePageSize beginPageNum:0 refreshingBlock:refreshingBlock];
}

- (void)dr_setupRefreshingWithPageSize:(short)pageSize
                          beginPageNum:(NSInteger)beginPageNum
                       refreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock {
    [self _dr_setupRefreshingWithEnableHeader:YES enableFooter:YES pageSize:pageSize beginPageNum:beginPageNum refreshingBlock:refreshingBlock];
}
- (void)dr_setupFooterRefreshingWithPageSize:(short)pageSize beginPageNum:(NSInteger)beginPageNum refreshingBlock:(void (^)(__kindof UIScrollView * _Nonnull, NSInteger))refreshingBlock {
    [self _dr_setupRefreshingWithEnableHeader:NO enableFooter:YES pageSize:pageSize beginPageNum:beginPageNum refreshingBlock:refreshingBlock];
}
- (void)_dr_setupRefreshingWithEnableHeader:(BOOL)enableHeader
                               enableFooter:(BOOL)enableFooter
                                   pageSize:(short)pageSize
                               beginPageNum:(NSInteger)beginPageNum
                            refreshingBlock:(void(^)(__kindof UIScrollView *scrollView, NSInteger pageNum))refreshingBlock {
    __weak typeof(self) _self = self;
    if ( enableHeader ) {
        self.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            __strong typeof(_self) self = _self;
            if ( !self ) return ;
            refreshingBlock(self, self.dr_pageNum = self.dr_beginPageNum);
        }];
    }
    
    if ( enableFooter ) {
        self.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
            __strong typeof(_self) self = _self;
            if ( !self ) return;
            refreshingBlock(self, self.dr_pageNum);
        }];
    }
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.dr_pageSize = pageSize;
    if ( 0 != beginPageNum ) self.dr_beginPageNum = beginPageNum;
    self.dr_pageNum = beginPageNum;
    self.mj_footer.hidden = YES;
    
    self.mj_header.ignoredScrollViewContentInsetTop = self.contentInset.top;
    
    [UIScrollView.dr_refreshConfig configHeader:(MJRefreshGifHeader *)self.mj_header];
    [UIScrollView.dr_refreshConfig configFooter:(MJRefreshAutoGifFooter *)self.mj_footer];
}
- (void)dr_endRefreshingWithItemCount:(NSUInteger)itemCount {
    if ( self.dr_pageNum == self.dr_beginPageNum && self.mj_header ) {
        [self dr_endHeaderRefreshingWithItemCount:itemCount];
    }
    else {
        [self dr_endFooterRefreshingWithItemCount:itemCount];
    }
    self.dr_pageNum += 1;
}

- (void)dr_endRefreshing {
    if ( self.mj_header.state == MJRefreshStateRefreshing ) [self.mj_header endRefreshing];
    if ( self.mj_footer.state == MJRefreshStateRefreshing ) [self.mj_footer endRefreshing];
}

- (void)dr_endHeaderRefreshingWithItemCount:(NSUInteger)itemCount {
    [self.mj_header endRefreshing];
    if ( itemCount == 0 || itemCount == LTRefreshingNonePageSize ) { // 如果没有数据
        self.mj_footer.hidden = YES;
    }
    else {
        self.mj_footer.hidden = NO;
        if ( itemCount < self.dr_pageSize ) [self.mj_footer endRefreshingWithNoMoreData];   // 如果数据小于pageSize
        else  if ( self.mj_footer.state == MJRefreshStateNoMoreData ) [self.mj_footer resetNoMoreData];
    }
}

- (void)dr_endFooterRefreshingWithItemCount:(NSUInteger)itemCount {
    if ( itemCount < self.dr_pageSize ) [self.mj_footer endRefreshingWithNoMoreData];   // 如果数据小于pageSize
    else if ( self.mj_footer.state == MJRefreshStateNoMoreData ) [self.mj_footer resetNoMoreData];
    else [self.mj_footer endRefreshing];
}

- (void)dr_exeHeaderRefreshing {
    [self dr_exeHeaderRefreshingAnimated:YES];
}

- (void)dr_exeHeaderRefreshingAnimated:(BOOL)animated {
    if ( self.mj_header.state != MJRefreshStateIdle ) [self.mj_header endRefreshing];
    if ( animated ) {
        [self.mj_header beginRefreshing];
    }
    else {
        if ( self.mj_header.refreshingBlock != nil ) self.mj_header.refreshingBlock();
    }
}

- (void)dr_exeFooterRefreshing {
    self.mj_footer.hidden = NO;
    if ( self.mj_footer.state != MJRefreshStateIdle ) [self.mj_footer endRefreshing];
    [self.mj_footer beginRefreshing];
}

#pragma mark -

- (void)setDr_beginPageNum:(NSInteger)dr_beginPageNum {
    objc_setAssociatedObject(self, @selector(dr_beginPageNum), @(dr_beginPageNum), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)dr_beginPageNum {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setDr_pageNum:(NSInteger)dr_pageNum {
    objc_setAssociatedObject(self, @selector(dr_pageNum), @(dr_pageNum), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)dr_pageNum {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setDr_pageSize:(NSInteger)dr_pageSize {
    objc_setAssociatedObject(self, @selector(dr_pageSize), @(dr_pageSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)dr_pageSize {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end
