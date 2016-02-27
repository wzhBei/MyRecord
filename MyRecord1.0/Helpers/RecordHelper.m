//
//  RecordHelper.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "RecordHelper.h"

@implementation RecordHelper


//SINGLETON_DEFINE(RecordHelper)
SINGLETON_IMPL(RecordHelper)

#pragma mark -
#pragma public method
-(NSString *)createUniqueKey
{
    NSString *key = @"";
    
    
    
    return key;
}





#pragma mark -
#pragma private method


#pragma mark - 
#pragma setters and getters

- (NSArray *)records
{
    if (!_records) {
        _records = [NSArray array];
    }
    return _records;
}
@end
