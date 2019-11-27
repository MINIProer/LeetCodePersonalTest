//
//  LeetCode_1_ViewController+Service.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCode_1_ViewController+Service.h"
#import "NSArray+Category.h"

// View
#import "LeetCodeInputParamTextField.h"

// Tool
#import "LJMacroDefinition.h"

// Pod
#import <Masonry/Masonry.h>

// Framework
#import <NHMarkdown/NHMarkdown-Swift.h>

@implementation LeetCode_1_ViewController (Service)

//MARK:处理键盘将要展示时更新UI约束相关操作
- (void)LeetCode1Service_keyboardWillShow:(NSNotification *)notification {
    
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
- (void)LeetCode1Service_keyboardWillHidden:(NSNotification *)notification {
    
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

//MARK:给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
- (NSArray *)LeetCode1Service_findTheIndexListWithNumbers:(NSArray *)numbers targetNumber:(int)targetNumber {
    
    if (numbers.count == 0 || !numbers || numbers == nil) return @[];
    
    NSMutableDictionary *numbersDicM = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < numbers.count; i++) {
        
        [numbersDicM setObject:@(i) forKey:numbers[i]];
    }
    
    NSMutableArray *targetArray = [NSMutableArray array];
    
    for (int i = 0; i < numbers.count; i++) {
        
        int findNumber = targetNumber - [numbers[i] intValue];
        
        if ([numbers containsObject:[NSString stringWithFormat:@"%d", findNumber]]) {
            
            int findIndex = [[numbersDicM valueForKey:[NSString stringWithFormat:@"%d", findNumber]] intValue];
            
            [targetArray addObjectsFromArray:@[@(i), @(findIndex)]];
            
            return targetArray;
        }
    }
    
    return @[];
}

//MARK:数组转换成目标字符串
- (NSString *)LeetCode1Service_getDebugResultStringWithNumbersList:(NSArray *)numbersList {
    
    NSString *debugResultString = @"";
    
    if ([NSArray isEmptyArray:numbersList])  {
        
        debugResultString = @"返回值为空数组";
        
    } else {
        
        for (int i = 0; i < numbersList.count; i++) {
            
            if (numbersList.count == 1) {
                
                debugResultString = [debugResultString stringByAppendingString:[NSString stringWithFormat:@"[%@]", numbersList[i]]];
                
            } else {
                
                if (i == 0) {
                    
                    debugResultString = [debugResultString stringByAppendingString:[NSString stringWithFormat:@"[%@,", numbersList[i]]];
                    
                    NSLog(@"%@", debugResultString);
                    
                } else if (i == numbersList.count - 1) {
                    
                    if (numbersList.count == 2) {
                        
                        debugResultString = [debugResultString stringByAppendingString:[NSString stringWithFormat:@"%@]", numbersList[i]]];
                        
                    } else {
                        
                        debugResultString = [debugResultString stringByAppendingString:[NSString stringWithFormat:@",%@]", numbersList[i]]];
                    }
                    
                } else {
                    
                    debugResultString = [debugResultString stringByAppendingString:[NSString stringWithFormat:@"%@", numbersList[i]]];
                }
            }
        }
    }
    
    return debugResultString;
}

@end
