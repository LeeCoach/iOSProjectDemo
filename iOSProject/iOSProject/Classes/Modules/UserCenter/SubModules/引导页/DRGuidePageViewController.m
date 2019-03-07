//
//  DRGuidePageViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/27.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRGuidePageViewController.h"
#import "AppDelegate.h"

@interface DRGuidePageViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *imageNameArray;

@end

@implementation DRGuidePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageNameArray = [[NSMutableArray alloc] init];
    if (DRSCREEN_HEIGHT <= 480) {
        [self.imageNameArray addObjectsFromArray:@[@"640x960_1.jpg", @"640x960_2.jpg", @"640x960_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 1136/2.0) {
        [self.imageNameArray addObjectsFromArray:@[@"640x1136_1.jpg", @"640x1136_2.jpg", @"640x1136_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 1334/2.0) {
        [self.imageNameArray addObjectsFromArray:@[@"750x1334_1.jpg", @"750x1334_2.jpg", @"750x1334_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 2208/3.0) {
        [self.imageNameArray addObjectsFromArray:@[@"1242x2208_1.jpg", @"1242x2208_2.jpg", @"1242x2208_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 2436/3.0) {
        [self.imageNameArray addObjectsFromArray:@[@"1125x2436_1.jpg", @"1125x2436_2.jpg", @"1125x2436_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 1792/3.0) {
        [self.imageNameArray addObjectsFromArray:@[@"828x1792_1.jpg", @"828x1792_2.jpg", @"828x1792_3.jpg"]];
    }
    else if (DRSCREEN_HEIGHT <= 2688/3.0) {
        [self.imageNameArray addObjectsFromArray:@[@"1242x2688_1.jpg", @"1242x2688_2.jpg", @"1242x2688_3.jpg"]];
    }
    
    [self.view addSubview:self.scrollView];
    
    // 设置引导页上的跳过按钮
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    skipButton.titleLabel.font = DRFONT(12);
    [skipButton setTitle:@"跳过" forState:UIControlStateNormal];
    [skipButton setTitleColor:DRHexColor(0xffffff) forState:UIControlStateNormal];
    [skipButton setBackgroundColor:DRHexColor(0xeeeeee)];
    [skipButton.layer setCornerRadius:DRHEIGHT(10)];
    [skipButton addTarget:self action:@selector(startNewJourney) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipButton];
    [skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(DRHEIGHT(60));
        make.right.mas_equalTo(self.view.mas_right).offset(-DRWIDTH(20));
        make.size.mas_equalTo(CGSizeMake(DRWIDTH(50), DRHEIGHT(20)));
    }];
}

-(void)startNewJourney
{
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appDelegate setRootEntrance];
        });
    }];
}

#pragma mark - UISrollViewdelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark - lazyLoad
- (UIScrollView *)scrollView
{
    if (_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(self.imageNameArray.count*WIDTH, HEIGHT);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        NSInteger scrollViewPage = self.imageNameArray.count;
        for (int i = 0; i < scrollViewPage; i ++)
        {
            NSString *imageName = [self.imageNameArray objectAtIndex:i];

            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *WIDTH, 0, WIDTH, HEIGHT)];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.image = [UIImage imageNamed:imageName];
            [_scrollView addSubview:imageView];
            imageView.userInteractionEnabled = YES;
            if (i == scrollViewPage - 1) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [imageView addSubview:button];
                button.titleLabel.font = DRFONT(20);
                [button addTarget:self action:@selector(startNewJourney) forControlEvents:UIControlEventTouchUpInside];
                [button setTitle:@"立即学习" forState:0];
                [button setTitleColor:DRHexColor(0xffffff) forState:0];
                [button.layer setCornerRadius:15];
                button.layer.masksToBounds = YES;
                [button.layer setBorderColor:DRHexColor(0xffffff).CGColor];
                [button.layer setBorderWidth:1.5];
                
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.mas_equalTo(imageView);
                    make.bottom.mas_equalTo(imageView).offset(IS_IPhoneX_All ? (-DR_Height_SAFEAREA_BOTTOM + DRHEIGHT(-35)) : DRHEIGHT(-60));
                    make.width.mas_equalTo(DRWIDTH(110));
                    make.height.mas_equalTo(DRHEIGHT(30));
                }];
            }
        }
    }
    return _scrollView;
}

@end
