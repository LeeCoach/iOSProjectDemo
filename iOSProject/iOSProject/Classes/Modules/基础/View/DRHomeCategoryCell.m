//
//  DRHomeCategoryCell.m
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import "DRHomeCategoryCell.h"

@interface DRHomeCategoryCell()

@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation DRHomeCategoryCell

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
    self.iconImg.backgroundColor = DRRandomColor;
    self.titleLabel.text = itemModel.title;
    
}

- (void)clickSelfAction {
    !self.selectCategoryBlock?:self.selectCategoryBlock();
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.iconImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(DRHEIGHT(5));
        make.size.mas_equalTo(CGSizeMake(DRWIDTH(36), DRWIDTH(36)));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.iconImg.mas_bottom).offset(DRHEIGHT(5));
    }];
}

- (UIImageView *)iconImg
{
    if (!_iconImg) {
        _iconImg  = [[UIImageView alloc] init];
        _iconImg.image = [UIImage imageNamed:@""];
        [self.contentView addSubview:_iconImg];
    }
    return _iconImg;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.font = DRFONT(14);
        _titleLabel.textColor = DRHexColor(0x000000);
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
