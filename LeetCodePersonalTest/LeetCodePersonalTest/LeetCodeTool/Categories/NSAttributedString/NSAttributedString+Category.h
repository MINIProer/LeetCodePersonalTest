//
//  NSAttributedString+Category.h
//  LanJingerNews
//
//  Created by 姜书伦 on 2019/6/24.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Category)

/**
 *  设置富文本
 *
 *  @param sender 需要改变的文本数组
 *  @param string 原文本
 *  @param orginFont 原始字体
 *  @param orginColor 原始颜色
 *  @param attributeFont 富文本字体
 *  @param attributeColor 富文本颜色
 */
+ (NSAttributedString *)getAttributeWith:(id)sender string:(NSString *)string orginFont:(CGFloat)orginFont orginColor:(UIColor *)orginColor attributeFont:(CGFloat)attributeFont attributeColor:(UIColor *)attributeColor;

@end

NS_ASSUME_NONNULL_END
