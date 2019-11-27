//
//  UIImage+Category.h
//  LanJingerNews
//
//  Created by 姜书伦 on 2019/5/17.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)
/**
 根据颜色生成图片

 @param color   颜色
 @return        返回被处理过的图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;
/**
 图片设置圆角

 @param radius  圆角大小
 @param size    被处理的图片的尺寸
 @return        返回被处理过的图片
 */
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius
                              andSize:(CGSize)size;
/**
 根据颜色尺寸生成渐变色图片

 @param colors  渐变色
 @param rect    被处理的图片的尺寸
 @return        返回被处理过的图片
 */
+ (UIImage *)gradientImageWithColors:(NSArray *)colors
                                rect:(CGRect)rect;
/**
 修正图片旋转(上传图片/保存图片)

 @param image   被修正的图片
 @return        返回处理过的图片
 */
- (UIImage *_Nonnull)fixOrientation:(UIImage *_Nonnull)image;

@end

NS_ASSUME_NONNULL_END
