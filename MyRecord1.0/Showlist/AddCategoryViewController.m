//
//  AddCategoryViewController.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/3/5.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "AddCategoryViewController.h"

@interface AddCategoryViewController ()
//IBs
@property (weak, nonatomic) IBOutlet UICollectionView *colorCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;


@property (nonatomic, strong) NSArray *colorCollectionDatasource;
@end

@implementation AddCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionDataSource];
    [self.colorCollectionView setCollectionViewLayout:self.flowLayout];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 
#pragma mark initializations

- (void)initCollectionDataSource
{
    NSMutableArray *mutableArray =[NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        for (int j = 0 ; j < 4; j++) {
            for (int k = 0; k < 4; k++) {
                if (i == j && j == k) {
                    continue;
                } else {
                    UIColor *color = [UIColor colorWithRed:i / 4.0 green:j / 4.0 blue:k / 4.0 alpha:0.8];
                    [mutableArray addObject:color];
                }
            }
        }
    }
    self.colorCollectionDatasource = [NSArray arrayWithArray:mutableArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 60;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colorCell" forIndexPath:indexPath];
    if (!collectionCell) {

        NSLog(@"?");
    }
    
    
    return collectionCell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark privateMethod
- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [_flowLayout setItemSize:CGSizeMake(30, 30)];// 设置每个cell的大小
        [_flowLayout setMinimumInteritemSpacing:1.0f];// 水平方向相邻两个cell的最小距离
        [_flowLayout setMinimumLineSpacing:1.0f]; // 垂直方向相邻两个cell的最小距离
    }
    return _flowLayout;
}




#pragma mark -
#pragma mark privateMethod




@end
