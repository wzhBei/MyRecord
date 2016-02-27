//
//  CoredataHelper.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/21.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "CoredataHelper.h"
#import "LocalRecordCoordinator.h"
#import "RecordModel.h"

@implementation CoredataHelper

-(void)saveRecordWithRecordModel:(RecordModel *)recordModel
{
    CFUUIDRef uuidRef =CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueId = (__bridgeNSString *)uuidStringRef;
}

@end
