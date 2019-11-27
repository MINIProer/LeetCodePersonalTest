//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import "NSString+Category.h"

#import <CommonCrypto/CommonDigest.h>

#import "UILabel+Category.h"

@implementation NSString (Category)

//MARK:电话号码中间4位*显示
- (NSString *)showPhoneNumWithStar {
    if (self.length >= 11) {
        
        return [self stringByReplacingCharactersInRange:NSMakeRange(self.length - 8, 4) withString:@"****"];
        
    } else if (self.length >= 6 && self.length < 11) {
        
        return [self stringByReplacingCharactersInRange:NSMakeRange(self.length - 3, 2) withString:@"****"];
    }
    
    return self;
}

//MARK:银行卡号中间8位*显示
+ (NSString * _Nullable)getSecrectStringWithAccountNo:(NSString * _Nullable)accountNo {
    NSMutableString *newStr = [NSMutableString stringWithString:accountNo];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length > 12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}

//MARK:转为手机格式，默认为-
+ (NSString * _Nullable)stringMobileFormat:(NSString *)mobile {
    if (mobile.length == 11) {
        NSMutableString * value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@"-" atIndex:3];
        [value insertString:@"-" atIndex:8];
        return value;
    }
    
    return nil;
}

//MARK:组中文格式（几万）可自行添加数,金额数字添加单位（暂时写了万和亿，有更多的需求请参考写法来自行添加）
+ (NSString * _Nullable)stringChineseFormat:(double)value {
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿",value / 100000000];
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万",value / 10000];
    } else {
        return [NSString stringWithFormat:@"%.0f",value];
    }
}

//MARK:添加数字的千位
+ (NSString * _Nullable)countNumAndChangeformat:(NSString * )num {
    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat = @"###,###";
    //如要增加小数点请自行修改为@"###,###,##"
    return [moneyFormatter stringFromNumber:[num toNumber]];
}

//MARK:计算文字高度
- (CGFloat)heightWithFontSize:(CGFloat)fontSize
                        width:(CGFloat)width {
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    return  [self boundingRectWithSize:CGSizeMake(width, 0)
                               options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                            attributes:attrs context:nil].size.height;
}

//MARK:计算文字宽度
- (CGFloat)widthWithFontSize:(CGFloat)fontSize
                       height:(CGFloat)maxHeight {
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    return  [self boundingRectWithSize:CGSizeMake(0, maxHeight)
                               options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                            attributes:attrs context:nil].size.width;
}

//MARK:抹除运费小数末尾的0
- (NSString *)removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}

//MARK:去掉前后空格
- (NSString * _Nullable)trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

//MARK:----------------------------------------------------------private methods
//MARK:转换为NSNumber
- (NSNumber *)toNumber {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number = [formatter numberFromString:self];
    
    return number;
}

+ (NSURL * _Nullable)urlEncode:(NSString *_Nullable)urlString {
    NSURL *url = nil;
    
    if (urlString) {
        url = [NSURL URLWithString:urlString];
        if (!url) {
            url = [urlString encodeURL];
        }
    }
    return url;
}

- (NSURL *)encodeURL {
    
    NSString *percentStr = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return [NSURL URLWithString:percentStr];
}

+ (NSString * _Nullable)timeStampStringToDateString:(double)timeStampString {

    NSDate *myDate=[NSDate dateWithTimeIntervalSince1970:timeStampString];

    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];

    [formatter setDateFormat:@"YYYY年MM月dd日"];

    NSString *timeStr=[formatter stringFromDate:myDate];

    return timeStr;
}

//MARK:MD5
-(NSString * _Nullable)md5String {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

//MARK:SHA1
-(NSString * _Nullable)sha1String {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, (unsigned int)strlen(cStr), digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString * _Nullable)convertToJsonData:(NSDictionary * _Nullable)dict {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData
                                          encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" "
                            withString:@""
                               options:NSLiteralSearch
                                 range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n"
                            withString:@""
                               options:NSLiteralSearch
                                 range:range2];
    
    return mutStr;
}

+ (NSDictionary *)convertjsonStringToDict:(NSString *)jsonString {
    
    NSDictionary *retDict = nil;
    
    if ([jsonString isKindOfClass:[NSString class]]) {
        
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        retDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        
        return  retDict;
        
    } else {
        
        return retDict;
    }
}

//MARK:判断字符串是否为空串
+ (BOOL)isEmptyString:(NSString * _Nullable)string {
    
    if (!string || string == nil || [string isEqualToString:@""] || string.length == 0 || [string isKindOfClass:[NSNull class]] || string == NULL) {
     
        return YES;
        
    } else {
        
        NSString *trimmedStr = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if (!trimmedStr.length) {
        
            return YES;
        }
    }
    
    return NO;
}

//MARK:时间戳转化为实践间隔
+ (NSString * _Nullable)updateTimeForTimeInterval:(NSInteger)timeInterval {
    
    if (timeInterval == 0) return @"";
    
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    
    // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
    NSTimeInterval createTime = timeInterval;
    
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    
    NSInteger second = time / 60;
    
    if (time < 60) {
        return @"刚刚";
    }
    
    if (second < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",(long)second];
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate: date];
    
    NSInteger day = [[dateString componentsSeparatedByString:@"-"].lastObject integerValue];
    NSInteger month = [[dateString componentsSeparatedByString:@"-"][1] integerValue];
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:currentTime];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString1 = [formatter stringFromDate: date1];
    
    NSInteger day1 = [[dateString1 componentsSeparatedByString:@"-"].lastObject integerValue];
    NSInteger month1 = [[dateString1 componentsSeparatedByString:@"-"][1] integerValue];
    
    
    //秒转天数
    NSInteger days = time / 3600 / 24;
    
    NSDate *senddate = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy"];
    NSInteger currentYear = [[dateformatter stringFromDate:senddate] integerValue];
    NSInteger createYear = [[dateformatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:createTime]] integerValue];
    
    if ([dateString isEqualToString:dateString1]) {
        
        // 秒转小时
        NSInteger hours = time / 3600;
        if (hours < 24) {
            return [NSString stringWithFormat:@"%ld小时前", (long)hours];
        }
        
    } else {
        
        if (createYear == currentYear) {
            
            if (month == month1) {
//
                if (((long)day1 - (long)day) <= 7 && ((long)day1 - (long)day) != 0) {
                    
                    return [NSString stringWithFormat:@"%ld天前", (long)day1 - (long)day];
                    
                } else if (((long)day1 - (long)day) > 7) {
                    
                    if (((long)day1 - (long)day) > 7 && (createYear == currentYear)) {
                        
                        NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime];
                        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                        [formatter setDateFormat:@"MM-dd"];
                        NSString *dateString = [formatter stringFromDate: date];
                        
                        return [NSString stringWithFormat:@"%@",dateString];
                    }
                }
                
            }
            else {

                //                if (((long)day1 - (long)day) > 7) {
                //
                //                    if (((long)day1 - (long)day) > 7 && (createYear == currentYear)) {
                //
                
                if (days <= 7) {
                    
                    return [NSString stringWithFormat:@"%ld天前", days];
                    
                } else {
                 
                    NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime];
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    [formatter setDateFormat:@"MM-dd"];
                    NSString *dateString = [formatter stringFromDate: date];
                    
                    return [NSString stringWithFormat:@"%@",dateString];
                }
                //                    }
                //                }
            }
            
        } else {
            
            if (createYear != currentYear) {
                
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"YY-MM-dd"];
                NSString *dateString = [formatter stringFromDate: date];
                
                return [NSString stringWithFormat:@"%@",dateString];
            }
        }
    }
    
    return @"";
}

//MARK:获取规定行数，拼接末尾位置文案的的最新文本
+ (NSMutableString * _Nullable)replaceWithString:(NSString * _Nullable)string
                                        forLabel:(UILabel * _Nullable)label
                               maxShowLineNumber:(NSInteger)lineNumber {
    
    NSArray *labelLinesArray = [label getLinesArrayOfStringInLabel:label];
    
    NSMutableString *newString = [NSMutableString string];
    
    if (labelLinesArray.count > lineNumber){
        
        NSMutableString *lastString = labelLinesArray[lineNumber - 1];
        
        for (int i = 0 ; i < lineNumber - 1; i++) {
            
            [newString appendString:labelLinesArray[i]];
        }
        
        [newString appendString:[lastString substringToIndex:lastString.length - lineNumber]];
        [newString appendString:[NSString stringWithFormat:@"...%@>>", string]];
    }
    
    return newString;
}

//MARK:文本中网页链接转换成特定文本
+ (NSString *)replaceOldString:(NSString *)oldString withString:(NSString *)string urlArray:(NSMutableArray *)urlArray {
    
    NSError *error;
    
    //可以识别url的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr   options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:oldString options:0 range:NSMakeRange(0, [oldString length])];
    
    [urlArray removeAllObjects];
    
    NSMutableArray *urlRangeArrayM = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        
        NSString* substringForMatch;
        
        substringForMatch = [oldString substringWithRange:match.range];
        
        NSLog(@"shislfj = %@", NSStringFromRange(match.range));
        
        [urlRangeArrayM addObject:NSStringFromRange(match.range)];
        
        [urlArray addObject:substringForMatch];
    }
    
    NSLog(@"urlArray = %@", urlArray);
    
    NSString *newString = oldString;
    
    for (int i = 0; i < urlRangeArrayM.count; i++) {
        
        NSString *str = urlArray[i];
        
        NSLog(@"caonima = %@", str);
        
        newString = [newString stringByReplacingOccurrencesOfString:str withString:string];
        
        NSLog(@"newString = %@", newString);
    }
    
    return newString;
}

+ (BOOL)isSameNewString:(NSString *)newString oldString:(NSString *)oldString {
    
    if ([newString isEqualToString:oldString]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isUrl {
    
    if(self == nil) {
        
        return NO;
    }
    
    NSString *url;
    
    if (self.length > 4 && [[self substringToIndex:4] isEqualToString:@"www."]) {
        
        url = [NSString stringWithFormat:@"http://%@", self];
        
    } else {
        
        url = self;
    }
    
    NSString *urlRegex = @"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    
    return [urlTest evaluateWithObject:url];
}

@end







