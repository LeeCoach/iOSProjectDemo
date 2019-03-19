//
//  DRHomeCategoryReusableView.m
//  iOSProject
//
//  Created by 李家二少 on 2019/3/13.
//  Copyright © 2019 Coach Lee. All rights reserved.
//

#import "DRHomeCategoryReusableView.h"

@interface DRHomeCategoryReusableView()

/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 更多按钮
 */
@property (nonatomic, strong) UIButton *moreBtn;

/**
 按钮事件回调
 */
@property (nonatomic, copy) moreBlock moreBlock;

@end


@implementation DRHomeCategoryReusableView

- (void)setTitle:(NSString *)title moreTitle:(NSString *)more moreBlock:(moreBlock)block {
    
    self.titleLabel.text = STR_CHANGE_nil(title);
    [self.moreBtn setTitle:STR_CHANGE_nil(more) forState:UIControlStateNormal];
    self.moreBlock = block;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(DRWIDTH(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-DRWIDTH(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.font = DRFONT(17);
        _titleLabel.textColor = DRHexColor(0x000000);
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIButton *)moreBtn
{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setTitle:@"" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:DRHexColor(0x808080) forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = DRFONT(12);
        [_moreBtn addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_moreBtn];
    }
    return _moreBtn;
}

- (void)clickButtonAction
{
    ! self.moreBlock ? : self.moreBlock();
}

@end
