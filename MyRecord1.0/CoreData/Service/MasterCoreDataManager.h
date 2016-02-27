//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "APPDefines.h"

@interface MasterCoreDataManager : NSObject

/// 永続化処理用コンテキスト
@property (nonatomic) NSManagedObjectContext *persistentContext;
/// メインスレッドで動作するコンテキスト
@property (nonatomic) NSManagedObjectContext *mainThredContext;

/// シングルトンインスタンスを返す
+ (MasterCoreDataManager *)sharedManager;

/// 一時的に使うコンテキストを生成して返す
- (NSManagedObjectContext *)temporaryContext;
/// 一時利用コンテキストを永続化保存する
- (BOOL)persistentSaveTemporaryContext:(NSManagedObjectContext *)context;

@end