//
//  DRUserCenterHeadView.m
//  iOSProject
//
//  Created by Coach on 2019/3/19.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRUserCenterHeadView.h"

@interface DRUserCenterHeadView()

@property (nonatomic, strong) UIImageView *logoImageview;
@property (nonatomic, strong) UILabel *nameLabel;

@end


@implementation DRUserCenterHeadView


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.logoImageview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(DRHEIGHT(5));
        make.size.mas_equalTo(CGSizeMake(DRWIDTH(60), DRWIDTH(60)));
    }];
    
    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImageview.mas_bottom).offset(DRHEIGHT(10));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

- (UIImageView *)logoImageview
{
    if (!_logoImageview) {
        _logoImageview  = [[UIImageView alloc] init];
        _logoImageview.image = [UIImage imageNamed:@""];
        _logoImageview.backgroundColor = DRHexColor(0xf2f2f2);
        [self addSubview:_logoImageview];
        [_logoImageview dr_setCornerRadius:DRWIDTH(30)];
    }
    return _logoImageview;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"这是昵称";
        _nameLabel.font = DRFONT(20);
        _nameLabel.textColor = DRHexColor(0x000000);
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

@end
