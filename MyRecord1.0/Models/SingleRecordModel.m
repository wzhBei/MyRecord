//
//  SingleRecordModel.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "SingleRecordModel.h"

///纪录每次的信息
@implementation SingleRecordModel


- (NSInteger)activityMinutes
{
    NSTimeInterval start = [self.startTime timeIntervalSinceReferenceDate];
    NSTimeInterval end = [self.endTime timeIntervalSinceReferenceDate];
    return (NSInteger)((end - start) / 60);
}


- (id)copyWithZone:(NSZone *)zone
{
    SingleRecordModel *copy = [[[self class] allocWithZone:zone] init];
    
    NSArray *propertyNames = @[@"startTime",@"endTime",@"descriptions"];
    COPY_PROPERTIES(propertyNames)

    
    return copy;
}


@end
