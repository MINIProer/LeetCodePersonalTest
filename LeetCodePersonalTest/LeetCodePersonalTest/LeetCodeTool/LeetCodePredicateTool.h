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

@end

NS_ASSUME_NONNULL_END
