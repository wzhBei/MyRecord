//
//  RecordModel.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "CategoryRecordModel.h"

@implementation CategoryRecordModel

-(instancetype)initWithDefaultValue
{
    self = [super init];
    
    [self configDefaultValues];
    return self;
}

-(void)configDefaultValues
{
//        RecordCategoryModel *model = [[RecordCategoryModel alloc] init];
//        model.projectName = @"test";
//        model.startTime = [NSDate date];
//        model.endTime = [NSDate date];
//        model.parentModel = self;
//        self.subRecords = @[model];
}

- (NSInteger)activitiesTimes
{
    NSInteger count = 0;
    
    for (RecordModel *recordModel in self.subProjects) {
        count += recordModel.activityTimesCount;
    }
    return count;
    
}

- (NSInteger)activityMinutes
{
    NSInteger minutes = 0;
    for (RecordModel *recordModel in self.subProjects) {
        minutes += recordModel.activityMinutsCount;
    }
    return minutes;
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryRecordModel *copy = [[[self class] allocWithZone:zone] init];

    NSArray *propertyNames = @[@"categoryName",@"showColor",@"descriptions"];
    COPY_PROPERTIES(propertyNames)
    copy.subProjects = [[NSArray alloc] initWithArray:self.subProjects copyItems:YES];
    return copy;
}

-(NSArray *)subProjects
{
    if (!_subProjects) {
        RecordModel *model = [[RecordModel alloc] init];
        model.title = @"跑步";
        RecordModel *model2 = [[RecordModel alloc] init];
        model2.title = @"跳绳";

        model.categoryModel = self;
        model2.categoryModel = self;
        
        model.isQuickStart = YES;
        model.isQuickStart = NO;
        _subProjects = @[model,model2];
    }
    return _subProjects;
}

-(NSString *)descriptions
{
    return @"VV is a cute penguin";
}
@end
