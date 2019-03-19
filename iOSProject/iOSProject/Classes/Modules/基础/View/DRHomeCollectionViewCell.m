//
//  DRHomeCollectionViewCell.m
//  iOSProject
//
//  Created by Coach on 2019/3/6.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRHomeCollectionViewCell.h"

@interface DRHomeCollectionViewCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailsLabel;


@end


@implementation DRHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickSelfAction)];
        [self.contentView addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)setItemModel:(DRHomeItemModel *)itemModel {
    _itemModel = itemModel;
    
    self.titleLabel.text = itemModel.title;
    self.detailsLabel.text = itemModel.details;
    
}

- (void)clickSelfAction {
    !self.didSelectItemBlock?:self.didSelectItemBlock(self.itemModel);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(DRHEIGHT(5), DRWIDTH(10), DRWIDTH(5), DRWIDTH(10)));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.bgView).offset(DRWIDTH(10));
    }];
    
    [self.detailsLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(DRHEIGHT(30));
        make.left.mas_equalTo(self.bgView.mas_left).offset(DRWIDTH(10));
        make.right.mas_equalTo(self.bgView.mas_right).offset(-DRWIDTH(10));
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(-DRHEIGHT(10));
    }];
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = DRHexColor(0xf2f2f2);
        [self.contentView addSubview:_bgView];
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.font = DRFONT(15);
        _titleLabel.textColor = DRHexColor(0x000000);
        [self.bgView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailsLabel
{
    if (!_detailsLabel) {
        _detailsLabel = [[UILabel alloc] init];
        _detailsLabel.text = @"";
        _detailsLabel.font = DRFONT(12);
        _detailsLabel.textColor = DRHexColor(0x000000);
        _detailsLabel.numberOfLines = 0;
        [self.bgView addSubview:_detailsLabel];
    }
    return _detailsLabel;
}

@end
