//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleRecordModel.h"
#import <UIKit/UIKit.h>
#import "RecordModel.h"


/* 编辑模式 和 查看模式*/
@interface CategoryRecordModel : NSObject <NSCopying>

// input
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) UIColor *showColor;
@property (nonatomic, strong) NSString *descriptions;
// 项目详细
@property (nonatomic, strong) NSArray/* RecordModel */ *subProjects;



// read only
@property (nonatomic, strong, readonly) NSDate *startTime;
@property (nonatomic, strong, readonly) NSDate *endTime;
@property (nonatomic, assign, readonly) NSInteger activitiesTimes;
@property (nonatomic, assign, readonly) NSInteger activityMinutes;

//----------------details-------------------------------------



- (instancetype)initWithDefaultValue;

@end
