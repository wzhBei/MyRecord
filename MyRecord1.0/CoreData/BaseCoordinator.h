//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APPDefines.h"

/// Coordinatorsのベースクラス、
/// 各クラスにて、initをoverrideして、自分のentityNameを設置すること
@interface BaseCoordinator : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managerContext;
@property (nonatomic, strong) NSString *entityName;

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
- (id)increaseNewObject;

@end
