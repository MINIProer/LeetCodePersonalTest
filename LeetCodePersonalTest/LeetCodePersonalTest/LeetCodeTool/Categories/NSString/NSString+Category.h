//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (Category)
/**
 电话号码中间4位*显示

 @return 例子:135*****262
 */
- (NSString *_Nonnull)showPhoneNumWithStar;


/**
 银行卡号中间8位*显示

 @param accountNo 银行卡号
 @return 例子:1305 **** **** 2620
 */
+ (NSString *_Nullable)getSecrectStringWithAccountNo:(NSString *_Nullable)accountNo;


/**
 转为手机格式，默认为-
 
 @param mobile 手机字符串
 @return <#return value description#>
 */
+ (NSString *_Nullable)stringMobileFormat:(NSString *_Nonnull)mobile;

/**
 组中文格式（几万）可自行添加数
 金额数字添加单位（暂时写了万和亿，有更多的需求请参考写法来自行添加）
 
 @param value 金额(double)
 @return <#return value description#>
 */
+ (NSString *_Nullable)stringChineseFormat:(double)value;


/**
 添加数字的千位符

 @param num <#num description#>
 @return <#return value description#>
 */
+ (NSString *_Nullable)countNumAndChangeformat:(NSString *_Nonnull)num;

/**
 *  NSString转为NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber *_Nonnull)toNumber;

/**
 计算文字高度
 
 @param fontSize 字体
 @param width 最大宽度
 @return 文字高度
 */
- (CGFloat)heightWithFontSize:(CGFloat)fontSize
                        width:(CGFloat)width;

/**
 计算文字宽度

 @param fontSize 字体
 @param maxHeight 最大高度
 @return 文字宽度
 */
- (CGFloat)widthWithFontSize:(CGFloat)fontSize
                      height:(CGFloat)maxHeight;
/**
 抹除小数末尾的0

 @return <#return value description#>
 */
- (NSString *_Nonnull)removeUnwantedZero;

/**
 去掉前后空格

 @return <#return value description#>
 */
- (NSString *_Nullable)trimmedString;

/**
 字符串转URL转码

 @param urlString url字符串
 @return URL
 */
+ (NSURL * _Nullable)urlEncode:(NSString *_Nullable)urlString;

+ (NSString * _Nullable)timeStampStringToDateString:(double)timeStampString;

/**
 *  MD5
 */
-(NSString * _Nullable)md5String;

/**
 *  MD5
 */
-(NSString * _Nullable)sha1String;

/**
 *  字典转Json
 */
+ (NSString * _Nullable)convertToJsonData:(NSDictionary * _Nullable)dict;

/**
 *  Json转字典
 */
+ (NSDictionary *_Nullable)convertjsonStringToDict:(NSString *_Nullable)jsonString;

/**
 *  判断字符串是否为空串
 */
+ (BOOL)isEmptyString:(NSString * _Nullable)string;

/**
 *  时间戳转化为实践间隔
 */
+ (NSString * _Nullable)updateTimeForTimeInterval:(NSInteger)timeInterval;

/**
 *  获取规定行数，拼接末尾位置文案的的最新文本
 *
 *  @param string 需要替换的文本
 *  @param label 替换文本的Label
 *  @param lineNumber 最大展示行数
 */
+ (NSMutableString * _Nullable)replaceWithString:(NSString * _Nullable)string
                                        forLabel:(UILabel * _Nullable)label
                               maxShowLineNumber:(NSInteger)lineNumber;

/**
 *  文本中网页链接转换成特定文本
 *
 *  @param oldString 原始文本
 *  @param string 替换文本
 */
+ (NSString *_Nullable)replaceOldString:(NSString *_Nullable)oldString
                             withString:(NSString *_Nullable)string
                               urlArray:(NSMutableArray *_Nullable)urlArray;

/**
 *  判断两个字符串是否相同
 *
 *  @param newString 新字符串
 *  @param oldString 旧字符串
 *
 *  @return bool
 */
+ (BOOL)isSameNewString:(NSString *)newString oldString:(NSString *)oldString;

/**
 *  判断字符串是否为URL
 */
- (BOOL)isUrl;

@end
