//
//  LocalSingleRecord+CoreDataProperties.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/4/6.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LocalSingleRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalSingleRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *startTime;
@property (nullable, nonatomic, retain) NSDate *endTime;
@property (nullable, nonatomic, retain) NSString *singleRecordID;
@property (nullable, nonatomic, retain) LocalRecord *localRecord;

@end

NS_ASSUME_NONNULL_END
