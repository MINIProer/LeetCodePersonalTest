//
//  LeetCodePredicateTool.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/26.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodePredicateTool.h"

@implementation LeetCodePredicateTool

//MARK:是否为~分隔的整形字符串
+ (BOOL)isValidCommaSeparatedNumbersListString:(NSString *)numbersListString {
    NSString *CommaSeparatedNumbersListStringRegex = @"\\d+(~\\d+)*";
    NSPredicate *CommaSeparatedNumbersListStringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CommaSeparatedNumbersListStringRegex];
    
    return [CommaSeparatedNumbersListStringTest evaluateWithObject:numbersListString];
}

//MARK:是否为纯数字
+ (BOOL)isValidNumberString:(NSString *)numberString {
    NSString *numberStringRegex = @"\\d{1,}";
    NSPredicate *numberStringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberStringRegex];
    
    return [numberStringTest evaluateWithObject:numberString];
}

@end
