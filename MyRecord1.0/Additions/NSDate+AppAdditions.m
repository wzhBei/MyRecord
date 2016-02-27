//
//  NSDate+AppAdditions.m
//  jcomplanner
//
//  Created by wangzh on 15/9/19.
//  Copyright (c) 2015年 jp.co.dreamarts. All rights reserved.
//

#import "NSDate+AppAdditions.h"

@implementation NSDate (AppAdditions)

/// "yyyy年MM月"
+ (NSString *)app_stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    return [dateFormatter stringFromDate:date];
}

/// "yyyy年MM月"
+ (NSDate *)app_dateFromString:(NSString *)stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    return [dateFormatter dateFromString:stringDate];
}

/// "yyyy年MM月dd日"
+ (NSString *)app_type2_stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    return [dateFormatter stringFromDate:date];
}

/// "yyyy年MM月dd日"
+ (NSDate *)app_type2_dateFromString:(NSString *)stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    return [dateFormatter dateFromString:stringDate];
}

/// "yyyy/MM/dd HH:mm"
+ (NSString *)app_type3_stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    return [dateFormatter stringFromDate:date];
}

/// "yyyy/MM/dd HH:mm"
+ (NSDate *)app_type3_dateFromString:(NSString *)stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    return [dateFormatter dateFromString:stringDate];
}

///当前時間の文字を返却
+ (NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *currentTimeStr = [formatter stringFromDate:[NSDate date]];
    return currentTimeStr;
}

+ (NSString *)weekFromDate:(NSDate *)date
{
    if (date == nil) {
        return @"";
    }
    NSCalendar* calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* comps = [calendar components:NSCalendarUnitWeekday
                                          fromDate:date];
    
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja"];
    
    //comps.weekdayは 1-7の値が取得できるので-1する
    NSString* weekDayStr = df.shortWeekdaySymbols[comps.weekday-1];
    
    return weekDayStr;
}

+ (NSInteger)secondsDifFromDate:(NSDate *)fromDt toDate:(NSDate *)toDt
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"JST"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
    unsigned int unitFlags = NSCalendarUnitSecond;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:fromDt toDate:toDt options:0];
    NSInteger seconds = [comps second];
    return seconds;
}

+ (NSDate *)dateMonths:(NSInteger)months agoFromDate:(NSDate *)referenceDate;
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setMonth:-months];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:referenceDate options:0];
    
    return newdate;
}


+(NSString*)timeformatFromSeconds:(NSInteger)seconds
{
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}

@end
