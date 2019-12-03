//
//  LeetCodePredicateTool.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/26.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodePredicateTool : NSObject

/**
 *  是否为~分隔的整型字符串
 *
 *  @param numbersListString ~分隔的整型字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isValidCommaSeparatedNumbersListString:(NSString *)numbersListString;

/**
 *  是否为纯数字
 *
 *  @param numberString 数字字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isValidNumberString:(NSString *)numberString;

/**
 *  是否为整数
 *
 *  @param integerString 整数
 */
+ (BOOL)isValidIntegerString:(NSString *)integerString;

/**
 *  是否为~分隔的整型字符串
 *
 *  @param bracketsListString ~分隔的整型字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isValidCommaSeparatedBracketsListString:(NSString *)bracketsListString;

/**
 *  是否为~分隔的整数(正整数、负整数、零)字符串
 *
 *  @param numbersListString 整数(正整数、负整数、零)字符串
 *
 *  @return YES/NO
 */
+ (BOOL)isValidCommaSeparatedAllNumbersListString:(NSString *)numbersListString;

@end

NS_ASSUME_NONNULL_END
