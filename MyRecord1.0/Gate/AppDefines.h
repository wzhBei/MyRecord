//
//  AppDefines.h
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 1>全局使用到的宏定义
 
 2>枚举
 
 */

@interface AppDefines : NSObject

#pragma mark - 
#pragma mark CoreData

#define CORE_DATA_LOCAL_NAME @"Local"
#define CORE_DATA_MASTER_NAME @"Master"
#define SQLITE_LOCAL_FILE_NAME @"Local.sqlite"
#define SQLITE_MASTER_FILE_NAME @"Master.sqlite"

#define Entity_Record @"LocalRecord"

#pragma mark -
#pragma mark Enum

#ifndef APP_ENUM
#define APP_ENUM( name_ ) \
typedef enum name_ : NSInteger name_; \
enum name_ : NSInteger
#endif

APP_ENUM(APPSatisfaction) {
    APPSatisfactionUndefine = 0,
    APPSatisfactionNG = 1,
    APPSatisfactionGeneral = 2,
    APPSatisfactionGood = 3,
    APPSatisfactionGreate = 4,
    APPSatisfactionPerfect = 5,
    
};

#pragma mark -
#pragma mark Method

#ifndef Singleton_h
#define Singleton_h

#define SINGLETON_IMPL( classname )\
+ (classname *)sharedInstance\
{\
static dispatch_once_t onceToken;\
static classname *_sharedInstance = nil;\
dispatch_once(&onceToken, ^{\
_sharedInstance = [[[self class] alloc] init];\
});\
return _sharedInstance;\
}

#define SINGLETON_DEFINE( classname )\
+ (classname *)sharedInstance;

#endif

@end
