//
//  UIColor+Category.h
//  LanJingerNews
//
//  Created by 姜书伦 on 2019/6/17.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)

/**
 *  根据16进制字符串转换颜色
 *
 *  @param color 16进制字符串
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  根据16进制字符串&透明度转换颜色
 *
 *  @param color 16进制字符串
 *  @param alpha 透明度
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
