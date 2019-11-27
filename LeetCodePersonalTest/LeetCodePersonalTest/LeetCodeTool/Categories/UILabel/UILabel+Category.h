//
//  UILabel+Category.h
//  LanJingerNews
//
//  Created by lg-hms on 2019/4/28.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

/**
 获取label数组(label中文字的行数和每一行的内容)

 @param label label
 @return label数组(label中文字的行数和每一行的内容)
 */
- (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label;

/**
 *  获取Label的行内容数组
 *
 *  @param text 内容文本
 *  @param font 字体
 *  @param rect label尺寸
 */
+ (NSArray *)getLinesArrayOfStringWithContent:(NSString *)text font:(UIFont *)font rect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
