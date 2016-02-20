//
//  SingleRecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailRecordModel : NSObject

@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;
//@property (nonatomic, strong) 枚举 满意度
@property (nonatomic, strong) NSString *descriptions;

@end
