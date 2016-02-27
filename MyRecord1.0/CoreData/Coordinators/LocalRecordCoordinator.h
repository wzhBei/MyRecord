//
//  RecordCoordinator.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/20.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "BaseCoordinator.h"
#import "LocalRecord.h"
#import "RecordModel.h"

@interface LocalRecordCoordinator : BaseCoordinator

-(LocalRecord *)increaseObjectWithRecordModel:(RecordModel *)recordModel;

@end
