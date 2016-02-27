//
//  NSDate+AppAdditions.h
//  jcomplanner
//
//  Created by wangzh on 15/9/19.
//  Copyright (c) 2015年 jp.co.dreamarts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AppAdditions)

+ (NSString *)app_stringFromDate:(NSDate *)date;

+ (NSDate *)app_dateFromString:(NSString *)date;

+ (NSString *)getCurrentTime;

+ (NSString *)app_type2_stringFromDate:(NSDate *)date;

+ (NSDate *)app_type2_dateFromString:(NSString *)stringDate;

/// "yyyy/MM/dd HH:mm"
+ (NSString *)app_type3_stringFromDate:(NSDate *)date;

/// "yyyy/MM/dd HH:mm"
+ (NSDate *)app_type3_dateFromString:(NSString *)stringDate;

+ (NSString *)weekFromDate:(NSDate *)date;

+ (NSInteger)secondsDifFromDate:(NSDate *)fromDt toDate:(NSDate *)toDt;

+ (NSDate *)dateMonths:(NSInteger)months agoFromDate:(NSDate *)referenceDate;

@end
