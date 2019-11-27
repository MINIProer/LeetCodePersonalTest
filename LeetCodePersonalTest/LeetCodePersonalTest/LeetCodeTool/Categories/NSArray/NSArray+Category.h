//
//  NSArray+Category.h
//  LanJingerNews
//
//  Created by 姜书伦 on 2019/4/12.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Category)

/**
 *  冒泡排序（去重）
 *
 *  @param ascendingArray 未经排序的数组
 */
+ (NSMutableArray *)bubbleAscendingOrderSortWithArray:(NSMutableArray *)ascendingArray resultArray:(NSMutableArray *)resultArray;

/**
 *  获取lable的行数
 */
+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label
                                    width:(CGFloat)width;

/**
 *  数组判空
 */
+ (BOOL)isEmptyArray:(NSArray *)array;

/**
 *  获取特定字符串&特定字符串Range字典数组
 */
+ (void)searchAllTextRangeWithInitialArray:(NSMutableArray*)initialArray initialText:(NSString*)initialText regexString:(NSString*)regexString;

/**
 *  数组去重后冒泡排序
 *
 *  @param arr 原始数组
 */
+ (NSMutableArray *)deleteSameItemsInArray:(NSMutableArray *)arr;

@end

NS_ASSUME_NONNULL_END
