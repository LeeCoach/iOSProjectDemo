//
//  DRUserCenterViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRUserCenterViewController.h"

#import "DRUserCenterCell.h"
#import "DRUserCenterHeadView.h"

@interface DRUserCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DRUserCenterHeadView *headView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DRUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationBarItem];
    [self.tableView dr_exeHeaderRefreshing];
}

- (void)setNavigationBarItem
{
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"设置" forState:UIControlStateNormal];
    [addBtn setTitleColor:DRHexColor(0x333333) forState:UIControlStateNormal];
    addBtn.titleLabel.font = DRFONT(14);
    [addBtn addTarget:self action:@selector(setUpBotton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
}

- (void)setUpBotton {
    
}

//
- (void)requestReloadData
{
    @weakify(self)
    for (int k = 0; k < 10; k++) {
        [self.dataArray addObject:@""];
    }
    
    [weak_self.tableView dr_endRefreshing];
    [weak_self.tableView reloadData];
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DRUserCenterCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DRUserCenterCell class])];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Example%@",@(indexPath.row+1)];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cls = NSClassFromString([NSString stringWithFormat:@"Example%@ViewController", @(indexPath.row+1)] );
    
    if (cls) {
        [self.navigationController pushViewController:[cls new] animated:YES];
    }
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = DRHEIGHT(44);
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        _tableView.tableHeaderView = self.headView;
        
        [self.view addSubview:_tableView];
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, (IS_IPhoneX_All?DR_Height_SAFEAREA_BOTTOM:0), 0));
        }];
        
        [_tableView registerClass:[DRUserCenterCell class] forCellReuseIdentifier:NSStringFromClass([DRUserCenterCell class])];
        
        @weakify(self)
        [_tableView dr_setupRefreshingWithPageSize:10 beginPageNum:1 refreshingBlock:^(__kindof UIScrollView * _Nonnull scrollView, NSInteger pageNum) {
            //do something
            [weak_self requestReloadData];
        }];
    }
    return _tableView;
}

- (DRUserCenterHeadView *)headView {
    if (_headView == nil) {
        _headView = [[DRUserCenterHeadView alloc] initWithFrame:CGRectMake(0, 0, DRSCREEN_WIDTH, DRHEIGHT(120))];
    }
    return _headView;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
