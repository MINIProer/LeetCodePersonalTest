//
//  LeetCodeDetailUITool.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/28.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LeetCodeDetailUIToolType) {
    LeetCodeDetailUIToolTypeSuject_1 = 1,       // 两数之和
    LeetCodeDetailUIToolTypeSuject_8 = 8        // 回文数
};

@class NHMarkdownView, LeetCodeInputParamTextField, LeetCodeInputParamTextField;

@interface LeetCodeDetailUITool : NSObject

/** <UI属性> **/

/** 父控件 */
@property (nonatomic, strong) UIView *superView;

/** 展示MarkDown文本 */
@property (nonatomic, strong) NHMarkdownView *mdView;

/** 输入参数TextField - 1 */
@property (nonatomic, strong) LeetCodeInputParamTextField *inputParam1TextField;

/** 输入参数TextField - 2 */
@property (nonatomic, strong) LeetCodeInputParamTextField *inputParam2TextField;

/** <计算属性> **/

/** 键盘显示弹出时间 */
@property (nonatomic, assign) double keyboardMoveDuration;

/** 键盘弹出高度 */
@property (nonatomic, assign) CGFloat keyboardPopHeight;

/** 控制通知执行次数 */
@property (nonatomic, assign) int thirdKeybordDealFuncTime;

/** UI工具类型 */
@property (nonatomic, assign) LeetCodeDetailUIToolType type;

/**
 *  UI工具类单例
 */
+ (instancetype)sharedInstance;

/**
 *  根据类型初始化业务UI
 *
 *  @param type         UI工具类型
 *  @param superView    父控件
 */
- (void)setupUIWithType:(LeetCodeDetailUIToolType)type superView:(UIView *)superView;

/**
 *  加载习题解析文档
 *
 *  @param subjectIndex 习题索引号
 */
- (void)loadHTMLStringWithSubjectIndex:(int)subjectIndex;

@end

NS_ASSUME_NONNULL_END
