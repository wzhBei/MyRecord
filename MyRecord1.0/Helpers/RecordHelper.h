//
//  RecordHelper.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

/*
  1>保存RecordModel
  2>编辑中的相关处理
 
 
 */
#import <Foundation/Foundation.h>
#import "RecordModel.h"
#import "AppDefines.h"

@interface RecordHelper : NSObject


SINGLETON_DEFINE(RecordHelper)

@property (nonatomic, strong) NSArray/* RecordModel*/ *records;



// ------------method-------------------------


//?????
- (NSString *)createUniqueKey;


@end
