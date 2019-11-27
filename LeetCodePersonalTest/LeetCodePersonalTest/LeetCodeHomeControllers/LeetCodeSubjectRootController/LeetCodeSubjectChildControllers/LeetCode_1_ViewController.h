//
//  LeetCode_1_ViewController.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class NHMarkdownView, LeetCodeInputParamTextField, LeetCodeInputParamTextField;

@interface LeetCode_1_ViewController : LeetCodeBaseViewController

/** <UI属性> **/

/** 展示MarkDown文本 */
@property (nonatomic, strong) NHMarkdownView *mdView;

/** 数组参数(整型)TextField */
@property (nonatomic, strong) LeetCodeInputParamTextField *numbersTextField;

/** 目标数字参数(整型)TextField */
@property (nonatomic, strong) LeetCodeInputParamTextField *targetNumberTextField;

/** <计算属性> **/

/** 键盘显示弹出时间 */
@property (nonatomic, assign) double keyboardMoveDuration;

/** 键盘弹出高度 */
@property (nonatomic, assign) CGFloat keyboardPopHeight;

/** 控制通知执行次数 */
@property (nonatomic, assign) int thirdKeybordDealFuncTime;

@end

NS_ASSUME_NONNULL_END
