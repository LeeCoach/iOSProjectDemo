//
//  DRHomeViewController.m
//  iOSProject
//
//  Created by Coach on 2019/2/26.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import "DRHomeViewController.h"

#import "DRHomeCollectionViewCell.h"

@interface DRHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation DRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.collectionView dr_exeHeaderRefreshing];
    
}

//
- (void)requestReloadData
{
    @weakify(self)
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int k = 0; k < 20; k++) {
        DRHomeItemModel *itemModel = [[DRHomeItemModel alloc] init];
        itemModel.title = @"这是标题";
        itemModel.details = @"这是内容介绍，别顶时来运转；柜里林晓炜塔里木河fmsp图格里克鄙蝇；虹梅南路西藏大学pofj断案大师fpoj精神可嘉数字电视精神支柱dojf";
        itemModel.vcName = @"";
        
        [self.dataArray addObject:itemModel];
    }
             
    [weak_self.collectionView dr_endRefreshing];
    [weak_self.collectionView reloadData];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DRHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DRHomeCollectionViewCell class]) forIndexPath:indexPath];
    cell.itemModel = self.dataArray[indexPath.row];
    
    [cell layoutSubviews];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //doSomething
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(DRSCREEN_WIDTH - DRWIDTH(20), DRHEIGHT(70));
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return DRWIDTH(10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return DRWIDTH(10);
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
        
        [_collectionView registerClass:[DRHomeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([DRHomeCollectionViewCell class])];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        @weakify(self)
        [_collectionView dr_setupRefreshingWithPageSize:LTRefreshingNonePageSize beginPageNum:1 refreshingBlock:^(__kindof UIScrollView * _Nonnull scrollView, NSInteger pageNum) {
            [weak_self requestReloadData];
        }];
    }
    return _collectionView;
}

@end
