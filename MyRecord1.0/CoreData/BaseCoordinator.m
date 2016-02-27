//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "BaseCoordinator.h"
#import "LocalCoreDataManager.h"

NSString *kIDFormat = @"%06ld";

@interface BaseCoordinator ()

@end

@implementation BaseCoordinator

- (instancetype)initWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self) {
        _managerContext = context;
    }
    return self;
}

- (instancetype)initWithContext:(NSManagedObjectContext *)context allFlag:(BOOL)allFlag
{
    self = [self initWithContext:context];

    return self;
}

- (instancetype)initForConfigWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if ([self initWithContext:context]) [self applyConfig];
    return self;
}

- (void)applyConfig
{

}

#pragma mark -
#pragma mark FetchRequest
- (NSFetchRequest *)fetchRequestWithPredicate:(NSPredicate *)aPredicate sortDescriptors:(NSArray *)aSort
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:self.entityName
                                              inManagedObjectContext:self.managerContext];
    [fetchRequest setEntity:entity];
    
    if (aPredicate != nil) {
        [fetchRequest setPredicate:aPredicate];
    }
    
    if (aSort) {
        [fetchRequest setSortDescriptors:aSort];
    }
    
    return fetchRequest;
}


/**
 * @brief insertする時、IDを作成
 * @return 作成したID
 **/
- (NSString *)increaseID
{
    NSString *currentMax = [self fetchMaxID];
    if (currentMax == nil) {
        currentMax = [NSString stringWithFormat:kIDFormat, 0l];
    }
    NSInteger idNumber = [currentMax integerValue];
    idNumber++;
    
    return [NSString stringWithFormat:kIDFormat, idNumber];
}


/**
 * @brief 各クラスで実装する、現時点最大のIDを取得する
 * @return 現時点最大のID
 **/
- (NSString *)fetchMaxID
{
    return nil;
}

#pragma mark -
#pragma mark Sort

/**
 * @brief 検索用のソートを作成
 * @param [in] order:ソート参照用のキー
 * @param [in] asc:ソート順、YES昇順、NO降順
 * @return ソートディスクリプタ
 **/
- (NSArray *)createOrder:(NSString *)order Asc:(BOOL) asc
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:order ascending:asc];
    return  [[NSArray alloc] initWithObjects:sortDescriptor, nil];
}

- (NSArray *)createOrders:(NSArray *)orders Asc:(BOOL) asc
{
    NSMutableArray *orderDescriptors =[NSMutableArray array];
    for (NSString *order in orders) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:order ascending:asc];
        [orderDescriptors addObject:sortDescriptor];
    }
    return orderDescriptors;
}

- (NSArray *)orderDescriptors
{
    return @[[[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES]];
}

- (NSMutableArray *)configuratedSubPredicates
{
    NSMutableArray *subPredicates = [NSMutableArray array];
    

    return subPredicates;
}

- (id)increaseNewObject
{
    id localObject = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:self.managerContext];
    return localObject;
}

@end
