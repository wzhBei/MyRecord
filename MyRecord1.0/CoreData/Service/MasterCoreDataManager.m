//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "MasterCoreDataManager.h"

@interface MasterCoreDataManager ()

@property (nonatomic) NSManagedObjectModel *managedObjectModel;
@property (nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation MasterCoreDataManager

static MasterCoreDataManager *coreDataManager_ = nil;

+ (MasterCoreDataManager *)sharedManager
{
    // インスタンスが無ければ格納
    if (!coreDataManager_) {
        coreDataManager_ = [MasterCoreDataManager new];
    }
    
    return coreDataManager_;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self resetContexts];
    }
    return self;
}

- (BOOL)persistentSaveTemporaryContext:(NSManagedObjectContext *)context
{
    // =============== 引数チェック =============== //
    if (!context) {
        return NO;
    }
    
    // =============== 変数用意 =============== //
    __block bool result = NO;
    
    // =============== 保存処理 =============== //
    [context performBlockAndWait:^{
        // 一次保存
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"%@", error);
        } else {
            // 二次保存
            [self.mainThredContext performBlockAndWait:^{
                NSError *error = nil;
                if (![self.mainThredContext save:&error]) {
                    NSLog(@"%@", error);
                } else {
                    // 三次保存
                    [self.persistentContext performBlockAndWait:^{
                        NSError *error = nil;
                        if (![self.persistentContext save:&error]) {
                            NSLog(@"%@", error);
                        } else {
                            result = YES;
                        }}];
                }}];
        }}];
    // =============== 結果を返す =============== //
    [self.mainThredContext updatedObjects];
    //[context updatedObjects];
    return result;
}

- (void)resetContexts
{
    // 永続化用コンテキスト
    if (!_persistentContext) {
        _persistentContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_persistentContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    
    // メインスレッドコンテキスト
    _mainThredContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _mainThredContext.parentContext = _persistentContext;
}

- (NSManagedObjectContext *)temporaryContext
{
    NSManagedObjectContext *temporaryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    temporaryContext.parentContext = self.mainThredContext;
    [temporaryContext updatedObjects];
    return temporaryContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel == nil) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:CORE_DATA_MASTER_NAME withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator == nil) {
        // AppドキュメントのディレクトリURLを取得し、StoreURLを生成
        NSURL *documentDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSURL *storeURL = [documentDirectoryURL URLByAppendingPathComponent:SQLITE_MASTER_FILE_NAME];
        // ストアコーディネーターを生成
        NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        // ストアコーディネーター使って、保存先を確保(生成or取得)する
        NSError *error = nil;
        NSDictionary *storeOptions = @{NSInferMappingModelAutomaticallyOption:@YES,
                                       NSMigratePersistentStoresAutomaticallyOption:@YES};
        NSPersistentStore *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                                      configuration:nil
                                                                                                URL:storeURL
                                                                                            options:storeOptions
                                                                                              error:&error];
        // 保存先の確保ができていればストアコーディネータをインスタンス変数に格納
        if (!persistentStore) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        _persistentStoreCoordinator = persistentStoreCoordinator;
    }
    
    return _persistentStoreCoordinator;
}

@end