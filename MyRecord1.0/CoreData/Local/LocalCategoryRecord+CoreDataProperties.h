//
//  LocalCategoryRecord+CoreDataProperties.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/4/23.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LocalCategoryRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalCategoryRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *categoryModelID;
@property (nullable, nonatomic, retain) NSString *categoryName;
@property (nullable, nonatomic, retain) NSNumber *showColorIndex;
@property (nullable, nonatomic, retain) NSSet<LocalRecord *> *records;

@end

@interface LocalCategoryRecord (CoreDataGeneratedAccessors)

- (void)addRecordsObject:(LocalRecord *)value;
- (void)removeRecordsObject:(LocalRecord *)value;
- (void)addRecords:(NSSet<LocalRecord *> *)values;
- (void)removeRecords:(NSSet<LocalRecord *> *)values;

@end

NS_ASSUME_NONNULL_END
