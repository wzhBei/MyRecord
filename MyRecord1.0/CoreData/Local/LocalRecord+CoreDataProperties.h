//
//  LocalRecord+CoreDataProperties.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/20.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LocalRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *projectname;
@property (nullable, nonatomic, retain) NSString *category;
@property (nullable, nonatomic, retain) NSDate *startTime;
@property (nullable, nonatomic, retain) NSDate *endTime;
@property (nullable, nonatomic, retain) NSNumber *actionTimes;
@property (nullable, nonatomic, retain) NSData *subActivities;

@end

NS_ASSUME_NONNULL_END
