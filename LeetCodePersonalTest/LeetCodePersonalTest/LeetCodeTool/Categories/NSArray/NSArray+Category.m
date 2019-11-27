//
//  NSArray+Category.m
//  LanJingerNews
//
//  Created by 姜书伦 on 2019/4/12.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

+ (NSMutableArray *)bubbleAscendingOrderSortWithArray:(NSMutableArray *)ascendingArray resultArray:(nonnull NSMutableArray *)resultArray{
    for (int i = 0; i < ascendingArray.count; i++) {
        for (int j = 0; j < ascendingArray.count - 1 - i;j++) {
            if ([ascendingArray[j+1]intValue] < [ascendingArray[j] intValue]) {
                int temp = [ascendingArray[j] intValue];
                ascendingArray[j] = ascendingArray[j + 1];
                ascendingArray[j + 1] = [NSNumber numberWithInt:temp];
            }
        }
    }
    for (id object in ascendingArray) {
        if (![resultArray containsObject:object]) {
            [resultArray addObject:object];
        }
    }
    
    return resultArray;
}

+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label
                                    width:(CGFloat)width {
    NSString *text = [label text];
    UIFont *font = [label font];
//    CGRect rect = CGRectMake(label.frame.origin.x, label.frame.origin.y, [UIScreen mainScreen].bounds.size.width, label.frame.size.height);// [label frame];
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,width,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

//MARK:数组判空
+ (BOOL)isEmptyArray:(NSArray *)array {
    
    if (!array || array == nil || array.count == 0 || [array isKindOfClass:[NSNull class]]) {
        
        return YES;
    }
    
    return NO;
}

//MARK:获取特定字符串&特定字符串Range字典数组
+ (void)searchAllTextRangeWithInitialArray:(NSMutableArray*)initialArray initialText:(NSString*)initialText regexString:(NSString*)regexString {
    
    if (initialArray.count == 0) { //如果此时传入的array是空
        
        NSRange range = [initialText rangeOfString:regexString options:NSRegularExpressionSearch];
        
        if (range.location != NSNotFound) {
            
            //包装字典，存进数组
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[@"subString"] = [initialText substringWithRange:range];
            dict[@"subStringRange"] = [NSValue valueWithRange:range];
            [initialArray addObject:dict];
            
            //递归调用
            [self searchAllTextRangeWithInitialArray:initialArray initialText:initialText regexString:regexString];
            
        } else{
            
            return;
        }
        
    } else { //如果数组中已经有值了
        
        //1、取数组中最后一个字典，记录后串在原串中的起始位置，把该串及其之前的串去掉生成新串
        NSMutableDictionary *lastDict = [initialArray lastObject];
        NSRange lastRange = [lastDict[@"subStringRange"]rangeValue];
        NSUInteger newStringBeginLocation = lastRange.location+ lastRange.length;
        NSString*newString = [initialText substringFromIndex:newStringBeginLocation];
        
        //2、在新串中找符合的子串，如果找到，包装存进数组
        NSRange rangeInNewString = [newString rangeOfString:regexString options:NSRegularExpressionSearch];
        
        if (rangeInNewString.location != NSNotFound) {
            
            //包装字典，存进数组
            NSMutableDictionary*dict = [NSMutableDictionary dictionary];
            dict[@"subString"] = [newString substringWithRange:rangeInNewString];
            NSRange rangeIninitialText = NSMakeRange(rangeInNewString.location+newStringBeginLocation, rangeInNewString.length);
            dict[@"subStringRange"] = [NSValue valueWithRange:rangeIninitialText];
            [initialArray addObject:dict];
            
            //递归调用
            [self searchAllTextRangeWithInitialArray:initialArray initialText:initialText regexString:regexString];
            
        } else {
            
            return;
        }
    }
}

//MARK:冒泡
+ (void)bubbleSort:(NSMutableArray *)arr{
    
    if (arr.count <3) {
        return;
    }
    
    for (int j =1; j<= [arr count]; j++) {
        
        for(int i =0 ;i < j ; i++){
            
            if(i == [arr count] -1) return;
            
            NSString * str1 = [arr objectAtIndex:i];
            
            NSString * str2 = [arr objectAtIndex:i+1];
            
            if([str1 compare:str2] == NSOrderedDescending){
                
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
        }
    }
}

//MARK:数组去重后冒排序
+ (NSMutableArray *)deleteSameItemsInArray:(NSMutableArray *)arr {
    
    NSLog(@"去重前的数组%@", arr);
    
    NSMutableArray *tmpArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    [tmpArr addObject:[arr firstObject]];
    
    int j;
    
    for (int i = 0; i < arr.count; i++) {
        
        NSString *str = [arr objectAtIndex:i];
        
        for (j = 0; j < tmpArr.count; j++) {
            
            NSString *tmpStr = [tmpArr objectAtIndex:j];
            
            if ([str compare:tmpStr]==NSOrderedSame) {
                
                break;
            }
        }
        
        if (j==tmpArr.count) {
            
            [tmpArr addObject:str];
        }
    }
    
    NSLog(@"去重后的数组%@",tmpArr);
    
    [self bubbleSort:tmpArr];
    
    return tmpArr;
}

@end
