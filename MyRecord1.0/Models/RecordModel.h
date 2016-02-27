//
//  RecordModel.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailRecordModel.h"


/* 编辑模式 和 查看模式*/
@interface RecordModel : NSObject


//---------------summery--------------------------------------

//
@property (nonatomic, strong) NSString *projectName;


// 开始时间
@property (nonatomic, strong) NSDate *startTime;
// 结束时间
@property (nonatomic, strong) NSDate *endTime;

// 分类
@property (nonatomic, strong) NSString *category;


// 父亲层Search Key

// 父model
@property (nonatomic, assign) RecordModel *parentModel;

// 子项目
@property (nonatomic, strong) NSArray/* RecordModel*/ *subRecords;



// description
@property (nonatomic, strong) NSString *descriptions;

//----------------details-------------------------------------
// 项目详细
@property (nonatomic, strong) NSArray/* DetailRecordModel */ *singleRecords;


-(instancetype)initWithDefaultValue;

- (NSInteger)activitiesTimes;

@end
