//
//  BaseCoordinator.h
//  jcomplanner
//
//  Created by yuyanan-mac on 2015/07/22.
//  Copyright (c) 2015年 jp.co.dreamarts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APPDefines.h"

/// Coordinatorsのベースクラス、
/// 各クラスにて、initをoverrideして、自分のentityNameを設置すること
@interface BaseCoordinator : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managerContext;
@property (nonatomic, strong) NSString *entityName;

//============== 属性保持用 ==============//
@property (nonatomic) bool requiredBulkBuilding;
@property (nonatomic) bool requiredSpecialBuildingContract;
@property (nonatomic) APPBuildingTypeType requiredBuildingType;
@property (nonatomic) bool requiredShortTermAgreement;
@property (nonatomic, assign) BOOL allFlag;//subPredicate 用

//============== プロパティ==============//
- (instancetype)initWithContext:(NSManagedObjectContext *)context;
- (instancetype)initWithContext:(NSManagedObjectContext *)context allFlag:(BOOL)allFlag;
- (instancetype)initForConfigWithContext:(NSManagedObjectContext *)context;
- (NSFetchRequest *)fetchRequestWithPredicate:(NSPredicate *)aPredicate sortDescriptors:(NSArray *)aSort;
- (NSString *)increaseID;
- (NSArray *)createOrder:(NSString*)order Asc:(BOOL)asc;
- (NSArray *)createOrders:(NSArray *)orders Asc:(BOOL)asc;
- (NSArray *)orderDescriptors;
- (NSMutableArray *)configuratedSubPredicates;

@end
