//
//  LeetCode_1_ViewController+KeyBoardCategory.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCode_1_ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeetCode_1_ViewController (KeyBoardCategory)

/**
 *  处理键盘将要展示时更新UI约束相关操作
 *
 *  @param notification 通知
 */
- (void)KeyBoardCategory_keyboardWillShow:(NSNotification *)notification;

/**
 *  处理键盘将要隐藏时更新UI约束相关操作
 *
 *  @param notification 通知
 */
- (void)KeyBoardCategory_keyboardWillHidden:(NSNotification *)notification;

@end

NS_ASSUME_NONNULL_END
