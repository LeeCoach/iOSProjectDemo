//
//  DRHomeViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRHomeViewController.h"

#import "DRHomeCategoryCell.h"
#import "DRHomeCollectionViewCell.h"
#import "DRHomeCategoryReusableView.h"

#import "DRSectionConfingModel.h"

@interface DRHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation DRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigationBarView];
    
    [self.collectionView dr_exeHeaderRefreshing];
    
}

- (void)setupNavigationBarView
{
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.backgroundColor = DRHexColor(0xf2f2f2);
    titleBtn.layer.cornerRadius = DRHEIGHT(30)/2;
    titleBtn.layer.masksToBounds = YES;
    titleBtn.frame = CGRectMake(0, 0, DRSCREEN_WIDTH - DRWIDTH(100), DRWIDTH(30));
    [titleBtn setImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
//    [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 30)];
//    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    [titleBtn setTitle:@"搜索你喜欢的内容" forState:UIControlStateNormal];
    [titleBtn setTitleColor:DRHexColor(0x333333) forState:UIControlStateNormal];
    titleBtn.titleLabel.font = DRFONT(13);
    [titleBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
    
}

- (void)searchBtnAction
{
    
}

//
- (void)requestReloadData
{
    @weakify(self)
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSMutableArray *array0 = [NSMutableArray arrayWithCapacity:0];
    for (int k = 0; k < 8; k++) {
        DRHomeItemModel *itemModel = [[DRHomeItemModel alloc] init];
        itemModel.title = @"这是标题";
        itemModel.details = @"这是内容介绍，别顶时来运转；柜里林晓炜塔里木河fmsp图格里克鄙蝇；虹梅南路西藏大学pofj断案大师fpoj精神可嘉数字电视精神支柱dojf";
        itemModel.vcName = @"";
        
        [array0 addObject:itemModel];
    }
    DRSectionConfingModel *section0  = [[DRSectionConfingModel alloc] init];
    section0.sectionItems = array0;
    
    NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:0];
    for (int k = 0; k < 10; k++) {
        DRHomeItemModel *itemModel = [[DRHomeItemModel alloc] init];
        itemModel.title = @"这是标题";
        itemModel.details = @"这是内容介绍，别顶时来运转；柜里林晓炜塔里木河fmsp图格里克鄙蝇；虹梅南路西藏大学pofj断案大师fpoj精神可嘉数字电视精神支柱dojf";
        itemModel.vcName = @"";
        
        [array1 addObject:itemModel];
    }
    DRSectionConfingModel *section1  = [[DRSectionConfingModel alloc] init];
    section1.sectionItems = array1;
    
    [self.dataArray addObjectsFromArray:@[section0,section1]];
             
    [weak_self.collectionView dr_endRefreshing];
    [weak_self.collectionView reloadData];
}

- (DRHomeItemModel *)creatItemModel
{
    DRHomeItemModel *itemModel = [[DRHomeItemModel alloc] init];
    return itemModel;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    DRSectionConfingModel *sectionModel = self.dataArray[section];
    return sectionModel.sectionItems.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        DRHomeCategoryReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([DRHomeCategoryReusableView class]) forIndexPath:indexPath];
        reusableView = headerView;
        @weakify(self)
        [headerView setTitle:@"推荐" moreTitle:@"更多" moreBlock:^{
            
            
            
        }];
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        // 底部视图
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        reusableView = footerview;
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = DRHexColor(0xf2f2f2);
        [footerview addSubview:lineView];
        [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(footerview.mas_top);
            make.left.mas_equalTo(footerview.mas_left).offset(DRWIDTH(10));
            make.right.mas_equalTo(footerview.mas_right).offset(-DRWIDTH(10));
            make.height.mas_equalTo(1);
        }];
    }
    return reusableView;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DRSectionConfingModel *sectionModel = self.dataArray[indexPath.section];
    switch (indexPath.section) {
        case 0:
        {
            DRHomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DRHomeCategoryCell class]) forIndexPath:indexPath];
            cell.itemModel = sectionModel.sectionItems[indexPath.row];
            
            [cell layoutSubviews];
            return cell;
        }
            break;
            
        case 1:
        {
            DRHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DRHomeCollectionViewCell class]) forIndexPath:indexPath];
            cell.itemModel = sectionModel.sectionItems[indexPath.row];
            
            [cell layoutSubviews];
            return cell;
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //doSomething
    DRSectionConfingModel *sectionModel = self.dataArray[indexPath.section];
    DRHomeItemModel *itemModel = sectionModel.sectionItems[indexPath.row];
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(DRSCREEN_WIDTH, DRHEIGHT(56));
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(DRSCREEN_WIDTH, DRHEIGHT(2));
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(DRSCREEN_WIDTH/4, DRHEIGHT(80));
    } else if (indexPath.section == 1) {
        return CGSizeMake(DRSCREEN_WIDTH - DRWIDTH(20), DRHEIGHT(90));
    }
    return CGSizeMake(0, 0);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return DRWIDTH(0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return DRWIDTH(0);
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = ({
            layout = [[UICollectionViewFlowLayout alloc] init];
            // 设置滚动方向:垂直
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            // 设置额外滚动区域
            layout.sectionInset = UIEdgeInsetsZero;
            layout;
        });
        
        _collectionView = ({
            _collectionView = [[UICollectionView alloc]
                               initWithFrame:CGRectZero
                               collectionViewLayout:layout];
            _collectionView.backgroundColor = [UIColor clearColor];
            _collectionView.showsVerticalScrollIndicator = NO;
            _collectionView.alwaysBounceVertical = NO;
            _collectionView.alwaysBounceHorizontal = NO;
            // 设置数据源
            _collectionView.dataSource = self;
            _collectionView.delegate = self;
            _collectionView;
        });
        
        
        [_collectionView registerClass:[DRHomeCategoryCell class] forCellWithReuseIdentifier:NSStringFromClass([DRHomeCategoryCell class])];
        [_collectionView registerClass:[DRHomeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([DRHomeCollectionViewCell class])];
        
        [_collectionView registerClass:[DRHomeCategoryReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([DRHomeCategoryReusableView class])];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, DR_Height_TabBar, 0));
        }];
        
        @weakify(self)
        [_collectionView dr_setupRefreshingWithPageSize:LTRefreshingNonePageSize beginPageNum:1 refreshingBlock:^(__kindof UIScrollView * _Nonnull scrollView, NSInteger pageNum) {
            [weak_self requestReloadData];
        }];
    }
    return _collectionView;
}

@end
