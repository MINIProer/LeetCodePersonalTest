//
//  NSMutableAttributedString+Category.h
//  LanJingerNews
//
//  Created by lg-hms on 2019/4/22.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Category)

- (void)addColor:(UIColor *)color
       substring:(NSString *)substring;

- (void)addBackgroundColor:(UIColor *)color
                 substring:(NSString *)substring;

- (void)addUnderlineForSubstring:(NSString *)substring;

- (void)addStrikeThrough:(int)thickness
               substring:(NSString *)substring;

- (void)addShadowColor:(UIColor *)color
                 width:(int)width
                height:(int)height
                radius:(int)radius
             substring:(NSString *)substring;

- (void)addFontWithName:(NSString *)fontName
                   size:(int)fontSize
              substring:(NSString *)substring;

- (void)addFont:(UIFont *)font
      substring:(NSString *)substring;

- (void)addAlignment:(NSTextAlignment)alignment
           substring:(NSString *)substring;

- (void)addColorToRussianText:(UIColor *)color;

- (void)addStrokeColor:(UIColor *)color
             thickness:(int)thickness
             substring:(NSString *)substring;

- (void)addVerticalGlyph:(BOOL)glyph
               substring:(NSString *)substring;
@end

NS_ASSUME_NONNULL_END
