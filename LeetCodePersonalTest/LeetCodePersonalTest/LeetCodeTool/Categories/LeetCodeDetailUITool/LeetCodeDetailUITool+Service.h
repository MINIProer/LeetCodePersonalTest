//
//  LeetCodeDetailUITool+Service.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/28.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeDetailUITool.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodeDetailUITool (Service)

/**
 *  处理键盘将要展示时更新UI约束相关操作
 *
 *  @param notification 通知
 */
- (void)LeetCodeService_keyboardWillShow:(NSNotification *)notification;

/**
 *  处理键盘将要隐藏时更新UI约束相关操作
 *
 *  @param notification 通知
 */
- (void)LeetCodeService_keyboardWillHidden:(NSNotification *)notification;

/** <---习题算法---> **/

/**
 *  给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 *
 *  @param numbers      整数数组
 *  @param targetNumber 目标值
 */
- (NSArray *)LeetCode1Service_findTheIndexListWithNumbers:(NSArray *)numbers targetNumber:(int)targetNumber;

/**
 *  数组转换成目标字符串
 *
 *  @param numbersList 整数数组
 */
- (NSString *)LeetCode1Service_getDebugResultStringWithNumbersList:(NSArray *)numbersList;

/**
 *  判断输入整数是否为回文数
 *
 *  @param originNumber 整数
 *
 *  @return YES/NO
 */
- (BOOL)LeetCode8Service_isPalindrome:(int)originNumber;

/**
 *  合并两个有序数组
 *
 *  @param array1 正整数升序数组
 *  @param array2 正整数升序数组
 *
 *  @return 合并后的升序数组
 */
- (NSArray *)LeetCode10Service_mergeOrderedArray:(NSArray *)array2 toAnotherOrderedArray:(NSArray *)array1;

/**
 *  有效的括号
 *
 *  @param brackets 括号字符串
 *
 *  @return YES/NO
 */
- (BOOL)LeetCode5Service_isValidBrackets:(NSString *)brackets;

/**
 *  括号字符串转换为括号字符数组
 *
 *  @param brackets 括号字符串
 *
 *  @return 括号字符数组
 */
- (NSArray *)LeetCode5Service_convertToBracketsArray:(NSString *)brackets;

@end

NS_ASSUME_NONNULL_END
