//
//  RecordCoordinator.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/20.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "LocalRecordCoordinator.h"

@implementation LocalRecordCoordinator

- (instancetype)initWithContext:(NSManagedObjectContext *)context
{
    self = [super initWithContext:context];
    if (self) {
        self.entityName = Entity_Record;
    }
    return self;
}

-(LocalRecord *)increaseObjectWithRecordModel:(RecordModel *)recordModel
{
    LocalRecord *localRecord = [self increaseNewObject];
    localRecord.projectname = recordModel.projectName;
    
    return localRecord;
}

@end
