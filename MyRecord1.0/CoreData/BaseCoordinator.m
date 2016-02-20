//
//  BaseCoordinator.m
//  jcomplanner
//
//  Created by yuyanan-mac on 2015/07/22.
//  Copyright (c) 2015年 jp.co.dreamarts. All rights reserved.
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
        _allFlag = NO;
    }
    return self;
}

- (instancetype)initWithContext:(NSManagedObjectContext *)context allFlag:(BOOL)allFlag
{
    self = [self initWithContext:context];
    if (self) {
        _allFlag = allFlag;
    }
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.requiredBulkBuilding = [defaults boolForKey:BULK_BUILDING_KEY] ? [defaults boolForKey:BULK_BUILDING_KEY] : NO;
    self.requiredSpecialBuildingContract = [defaults boolForKey:BUILDING_SPECIALITY_KEY] ? [defaults boolForKey:BUILDING_SPECIALITY_KEY] : NO;
    self.requiredBuildingType = [defaults integerForKey:BUILDINGTYPE_KEY] ? [defaults integerForKey:BUILDINGTYPE_KEY] : APPBuildingTypeCommon;
    self.requiredShortTermAgreement = [defaults boolForKey:AGREEMENT_TERM] ? [defaults integerForKey:AGREEMENT_TERM] : NO;
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
    // 生成
    NSMutableArray *subPredicates = [NSMutableArray array];
    
    if (self.allFlag) {
        return subPredicates;
    }
    
    // 格納
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"requiredBulkBuilding = %d",(int)self.requiredBulkBuilding];
    [subPredicates addObject:predicate];

    if (!self.requiredSpecialBuildingContract) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"requiredSpecialBuildingContract = NO"];
        [subPredicates addObject:predicate];
    }
    
    switch (self.requiredBuildingType) {
        case APPBuildingTypeSDU:
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"requiredBuildingType != %d", APPBuildingTypeMDU];
            [subPredicates addObject:predicate];
        }
            break;
        case APPBuildingTypeMDU:
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"requiredBuildingType != %d", APPBuildingTypeSDU];
            [subPredicates addObject:predicate];
        }
            break;
        default:
            break;
    }
    // 返す
    return subPredicates;
}

@end
