//
//  RecordModel.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "RecordModel.h"

@implementation RecordModel

-(instancetype)initWithDefaultValue
{
    self = [super init];
    
    [self configDefaultValues];
    return self;
}

-(void)configDefaultValues
{
    if (!self.subRecords) {
        RecordModel *model = [[RecordModel alloc] init];
        model.projectName = @"test";
        model.startTime = [NSDate date];
        model.endTime = [NSDate date];
        model.parentModel = self;
        self.subRecords = @[model];
    }
}

- (NSInteger)activitiesTimes
{
    return [self.subRecords count];
}
@end
