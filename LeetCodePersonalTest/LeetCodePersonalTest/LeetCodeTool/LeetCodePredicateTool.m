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

//MARK:是否为整数
+ (BOOL)isValidIntegerString:(NSString *)integerString {
    NSString *integerStringRegex = @"-?\\d{1,}";
    NSPredicate *integerStringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", integerStringRegex];
    
    return [integerStringTest evaluateWithObject:integerString];
}

//MARK:是否为~分隔的括号字符串
+ (BOOL)isValidCommaSeparatedBracketsListString:(NSString *)bracketsListString {
    NSString *CommaSeparatedBracketsListStringRegex = @"([(]|[)]|[{]|[}]|[\\[]|[\\]])*";
    NSPredicate *CommaSeparatedBracketsListStringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CommaSeparatedBracketsListStringRegex];
    
    return [CommaSeparatedBracketsListStringTest evaluateWithObject:bracketsListString];
}

@end
