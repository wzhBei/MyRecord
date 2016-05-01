//
//  LocalRecord+CoreDataProperties.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/4/11.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LocalRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *isQuickStart;
@property (nullable, nonatomic, retain) NSString *localRecordID;
@property (nullable, nonatomic, retain) NSString *recordName;
@property (nullable, nonatomic, retain) LocalCategoryRecord *categoryRecord;
@property (nullable, nonatomic, retain) NSSet<LocalSingleRecord *> *singleRecords;

@end

@interface LocalRecord (CoreDataGeneratedAccessors)

- (void)addSingleRecordsObject:(LocalSingleRecord *)value;
- (void)removeSingleRecordsObject:(LocalSingleRecord *)value;
- (void)addSingleRecords:(NSSet<LocalSingleRecord *> *)values;
- (void)removeSingleRecords:(NSSet<LocalSingleRecord *> *)values;

@end

NS_ASSUME_NONNULL_END
