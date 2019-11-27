//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/**
 把View加在Window上
 */
- (void)addToWindow;

@end

@interface UIView (Screenshot)

/**
 整体屏幕截图

 @return 整体屏幕截图图片
 */
- (UIImage *)screenshot;

/**
 ScrollView截图 contentOffset

 @param contentOffset <#contentOffset description#>
 @return 截图图片
 */
- (UIImage *)screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

/**
  整体屏幕按Rect截图

 @param frame 截图区域frame
 @return 截图图片
 */
- (UIImage *)screenshotInFrame:(CGRect)frame;

/**
 整个view转成图片

 @return 截图图片
 */
- (UIImage *)convertToImage;

@end

@interface UIView (Animation)

/**
 左右抖动动画
 */
- (void)shakeAnimation;

/**
 旋转180度动画
 */
- (void)trans180DegreeAnimation;


@end

@interface UIView (draw)

/**
 UIView画虚线
 
 @param lineLength 虚线的宽度
 @param lineSpacing 虚线的间距
 @param lineColor 虚线的颜色
 */
- (void)drawDashLineLength:(int)lineLength
               lineSpacing:(int)lineSpacing
                 lineColor:(UIColor *)lineColor;

/**
 *  给View添加阴影
 *
 *  @param view 需要添加阴影的view
 *  @param color 阴影颜色
 *  @param size 阴影偏移量
 */
- (void)drawShadowForView:(UIView *)view color:(UIColor *)color size:(CGSize)size;

@end

@interface UIView (setCorner)

/**
  顶部圆角

 @param cornerRadii 圆角角度
 */
- (void)setCornerOnTopWithCornerRadii:(CGFloat)cornerRadii;
/**
 底部圆角
 
 @param cornerRadii 圆角角度
 */
- (void)setCornerOnBottomWithCornerRadii:(CGFloat)cornerRadii;
/**
 全部圆角
 
 @param cornerRadii 圆角角度
 */
- (void)setAllCornerWithCornerRadii:(CGFloat)cornerRadii;


/**
 底部右侧设置圆角

 @param cornerRadii 圆角角度
 */
- (void)setCornerOnBottomRightWithCornerRadii:(CGFloat)cornerRadii;

@end
