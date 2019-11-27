//
//  NSData+Category.m
//  LanJingerNew
//
//  Created by lg-hms on 2019/3/6.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import "NSData+Category.h"

@implementation NSData (Category)

//MARK:获取当前的时间
+ (NSString*)getCurrentTimes {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    
    //将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
        
    return currentTimeString;
}

@end
