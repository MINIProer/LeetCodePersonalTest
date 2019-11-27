//
//  LeetCode_1_ViewController+KeyBoardCategory.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCode_1_ViewController+KeyBoardCategory.h"

// View
#import "LeetCodeInputParamTextField.h"

// Tool
#import "LJMacroDefinition.h"

// Pod
#import <Masonry/Masonry.h>

// Framework
#import <NHMarkdown/NHMarkdown-Swift.h>

@implementation LeetCode_1_ViewController (KeyBoardCategory)

//MARK:处理键盘将要展示时更新UI约束相关操作
- (void)KeyBoardCategory_keyboardWillShow:(NSNotification *)notification {
    
    //获取键盘弹出相关信息
    self.keyboardPopHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    self.keyboardMoveDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.thirdKeybordDealFuncTime++;
    
    if (self.thirdKeybordDealFuncTime < 2) {
        
        [UIView animateWithDuration:self.keyboardMoveDuration animations:^{
            
            if ([self.numbersTextField isFirstResponder]) {
                
                if (self.keyboardPopHeight) {
                    
                    [self.numbersTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                        make.height.mas_equalTo(kWIDTH_SCALE(35.f));
                        make.bottom.equalTo(self.view).offset(-self.keyboardPopHeight - kWIDTH_SCALE(30.f));
                    }];
                    
                    [self.targetNumberTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                        make.height.mas_equalTo(kWIDTH_SCALE(35.f));
                        make.top.equalTo(self.numbersTextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
                    }];
                    
                    [self.mdView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                        make.height.mas_equalTo(kWIDTH_SCALE(250.f));
                        make.bottom.equalTo(self.numbersTextField.mas_top).offset(-kWIDTH_SCALE(30.f));
                    }];
                }
                
            } else if ([self.targetNumberTextField isFirstResponder]) {
                
                [self.targetNumberTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                    make.height.mas_equalTo(kWIDTH_SCALE(35.f));
                    make.bottom.equalTo(self.view).offset(-self.keyboardPopHeight - kWIDTH_SCALE(30.f));
                }];
                
                [self.numbersTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
                    
                    make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                    make.height.mas_equalTo(kWIDTH_SCALE(35.f));
                    make.bottom.equalTo(self.targetNumberTextField.mas_top).offset(-kWIDTH_SCALE(30.f));
                }];
                
                [self.mdView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                    make.height.mas_equalTo(kWIDTH_SCALE(250.f));
                    make.bottom.equalTo(self.numbersTextField.mas_top).offset(-kWIDTH_SCALE(30.f));
                }];
            }
            
            [self.view layoutIfNeeded];
        }];
    }
}

//MARK:处理键盘将要隐藏时更新UI约束相关操作
- (void)KeyBoardCategory_keyboardWillHidden:(NSNotification *)notification {
    
    self.thirdKeybordDealFuncTime = 0;
    
    [UIView animateWithDuration:self.keyboardMoveDuration animations:^{
        
        [self.mdView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(kScreenTopHeight + kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(250.f));
        }];
        
        [self.numbersTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mdView.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(35.f));
        }];
        
        [self.targetNumberTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.numbersTextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(35.f));
        }];
        
        [self.view layoutIfNeeded];
    }];
}

@end
