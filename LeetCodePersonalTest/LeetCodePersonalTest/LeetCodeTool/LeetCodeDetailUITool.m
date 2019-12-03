//
//  LeetCodeDetailUITool.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/28.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeDetailUITool.h"

// View
#import "LeetCodeInputParamTextField.h"
#import "LeetCodeInputTipLabel.h"
#import "LeetCodeShowDebugResultLabel.h"
#import "LeetCodeDebugButton.h"

// Tool
#import "LJMacroDefinition.h"
#import "LeetCodePredicateTool.h"

// Category
#import "NSString+Category.h"
#import "NSArray+Category.h"
#import "LeetCodeDetailUITool+Service.h"

// Pod
#import <Masonry/Masonry.h>

// Framework
#import <NHMarkdown/NHMarkdown-Swift.h>
#import <WebKit/WebKit.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface LeetCodeDetailUITool () <UITextFieldDelegate>

/** <UI属性> **/

/** 校验提示文案Label - 1 */
@property (nonatomic, strong) LeetCodeInputTipLabel *inputTip1Label;

/** 校验提示文案Label - 2 */
@property (nonatomic, strong) LeetCodeInputTipLabel *inputTip2Label;

/** 编译结果Label */
@property (nonatomic, strong) LeetCodeShowDebugResultLabel *showDebugResultLabel;

/** 提交调试按钮Button */
@property (nonatomic, strong) LeetCodeDebugButton *debugButton;

/** <计算属性> **/

/** 参数1-字符串 */
@property (nonatomic, strong) NSString *param1String;

/** 参数2-字符串 */
@property (nonatomic, strong) NSString *param2String;

@end

@implementation LeetCodeDetailUITool

//MARK:-------------------------------------------------------------------------PublicMethod(公有方法)

//MARK:UI工具类单例
+ (instancetype)sharedInstance {
    static LeetCodeDetailUITool *_sharedLeetCodeDetailUITool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLeetCodeDetailUITool = [[LeetCodeDetailUITool alloc] init];
    });
    return _sharedLeetCodeDetailUITool;
}

//MARK:根据类型初始化业务UI
- (void)setupUIWithType:(LeetCodeDetailUIToolType)type superView:(UIView *)superView {
    
    self.thirdKeybordDealFuncTime = 0;
    
    self.type = type;
    
    self.superView = superView;
    
    [self setupSubViewsWithType:type superView:superView];
    
    [self setupConstraintsWithType:type superView:superView];
}

//MARK:根据类型添加子控件
- (void)setupSubViewsWithType:(LeetCodeDetailUIToolType)type superView:(UIView *)superView {
    
    if (type == LeetCodeDetailUIToolTypeSuject_1 || type == LeetCodeDetailUIToolTypeSuject_10) {
        
        [superView addSubview:self.mdView];
        
        [superView addSubview:self.inputParam1TextField];
        
        [superView addSubview:self.inputTip1Label];
        
        [superView addSubview:self.inputParam2TextField];
        
        [superView addSubview:self.inputTip2Label];
        
        [superView addSubview:self.debugButton];
        
        [superView addSubview:self.showDebugResultLabel];
        
    } else if (type == LeetCodeDetailUIToolTypeSuject_8 || type == LeetCodeDetailUIToolTypeSuject_5) {
        
        [superView addSubview:self.mdView];
        
        [superView addSubview:self.inputParam1TextField];
        
        [superView addSubview:self.inputTip1Label];
        
        [superView addSubview:self.showDebugResultLabel];
        
        [superView addSubview:self.debugButton];
    }
}

//MARK:根据类型添加约束
- (void)setupConstraintsWithType:(LeetCodeDetailUIToolType)type superView:(UIView *)superView {
    
    if (type == LeetCodeDetailUIToolTypeSuject_1 || type == LeetCodeDetailUIToolTypeSuject_10) {
        
        [self.mdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(superView).insets(UIEdgeInsetsMake(kScreenTopHeight + kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(250.f));
        }];
        
        [self.inputParam1TextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mdView.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(35.f));
        }];
        
        [self.inputTip1Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam1TextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
            make.left.equalTo(self.inputParam1TextField);
        }];
        
        [self.inputParam2TextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam1TextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(35.f));
        }];
        
        [self.inputTip2Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam2TextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
            make.left.equalTo(self.inputParam2TextField);
        }];
        
        [self.showDebugResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam2TextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
        }];
        
        [self.debugButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.showDebugResultLabel.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.bottom.equalTo(superView).offset(-kWIDTH_SCALE(10.f));
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth - kWIDTH_SCALE(20.f), kWIDTH_SCALE(35.f)));
        }];
        
    } else if (type == LeetCodeDetailUIToolTypeSuject_8 || type == LeetCodeDetailUIToolTypeSuject_5) {
        
        [self.mdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(superView).insets(UIEdgeInsetsMake(kScreenTopHeight + kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(250.f));
        }];
        
        [self.inputParam1TextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mdView.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            make.height.mas_equalTo(kWIDTH_SCALE(35.f));
        }];
        
        [self.inputTip1Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam1TextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
            make.left.equalTo(self.inputParam1TextField);
        }];
        
        [self.showDebugResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputParam1TextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
        }];
        
        [self.debugButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.showDebugResultLabel.mas_bottom).offset(kWIDTH_SCALE(30.f));
            make.bottom.equalTo(superView).offset(-kWIDTH_SCALE(10.f));
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth - kWIDTH_SCALE(20.f), kWIDTH_SCALE(35.f)));
        }];
    }
}

//MARK:加载习题解析文档
- (void)loadHTMLStringWithSubjectIndex:(int)subjectIndex {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"LeetCodeSubject-%d.md", (subjectIndex + 1)] ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    [self.mdView loadWithMarkdown:content completionHandler:^(WKWebView * _Nonnull wkWeb, WKNavigation * _Nullable wkNav) {
        
    }];
}

//MARK:-------------------------------------------------------------------------UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *subString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (self.type == LeetCodeDetailUIToolTypeSuject_1 || self.type == LeetCodeDetailUIToolTypeSuject_10) {
        
        if (textField == self.inputParam1TextField) {
            
            self.param1String = subString;
            
            if ([NSString isEmptyString:self.param1String]) {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusDefault;
            }
            
        } else if (textField == self.inputParam2TextField) {
            
            self.param2String = subString;
            
            if ([NSString isEmptyString:self.param2String]) {
                
                self.inputTip2Label.status = LeetCodeInputTipLabelStatusDefault;
            }
        }
        
    } else if (self.type == LeetCodeDetailUIToolTypeSuject_8 || self.type == LeetCodeDetailUIToolTypeSuject_5) {
        
        if (textField == self.inputParam1TextField) {
            
            self.param1String = subString;
            
            if ([NSString isEmptyString:self.param1String]) {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusDefault;
            }
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)

- (void)debugButtonClickAction {
    
    switch (self.type) {
        case LeetCodeDetailUIToolTypeSuject_1:
        {
            if ([LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param1String]) {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusSuccess;
                
            } else {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusFailed;
            }
            
            if ([LeetCodePredicateTool isValidNumberString:self.param2String]) {
                
                self.inputTip2Label.status = LeetCodeInputTipLabelStatusSuccess;
                
            } else {
                
                self.inputTip2Label.status = LeetCodeInputTipLabelStatusFailed;
            }
            
            if (![LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param1String] || ![LeetCodePredicateTool isValidNumberString:self.param2String]) return;
            
            NSArray *indexList = [self LeetCode1Service_findTheIndexListWithNumbers:[self.param1String componentsSeparatedByString:@"~"] targetNumber:[self.param2String intValue]];
            
            self.showDebugResultLabel.text = [self LeetCode1Service_getDebugResultStringWithNumbersList:indexList];
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_5:
        {
            if ([LeetCodePredicateTool isValidCommaSeparatedBracketsListString:self.param1String]) {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusSuccess;
                
            } else {
                
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusFailed;
                
                return;
            }
            
            self.showDebugResultLabel.text = [self LeetCode5Service_isValidBrackets:self.param1String] ? [NSString stringWithFormat:@"%@：是有效的括号", self.param1String] : [NSString stringWithFormat:@"%@：不是有效的括号", self.param1String];
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            if ([LeetCodePredicateTool isValidIntegerString:self.param1String]) {
        
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusSuccess;
                
            } else {
        
                self.inputTip1Label.status = LeetCodeInputTipLabelStatusFailed;
                
                return;
            }
            
            self.showDebugResultLabel.text = [self LeetCode8Service_isPalindrome:[self.param1String intValue]] ? [NSString stringWithFormat:@"%@：是回文数", self.param1String] : [NSString stringWithFormat:@"%@：不是回文数", self.param1String];
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_10:
        {
            if ([LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param1String]) {

                self.inputTip1Label.status = LeetCodeInputTipLabelStatusSuccess;

            } else {

                self.inputTip1Label.status = LeetCodeInputTipLabelStatusFailed;
            }

            if ([LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param2String]) {

                self.inputTip2Label.status = LeetCodeInputTipLabelStatusSuccess;

            } else {

                self.inputTip2Label.status = LeetCodeInputTipLabelStatusFailed;
            }

            if (![LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param1String] || ![LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.param2String]) return;

            NSArray *mergedList = [self LeetCode10Service_mergeOrderedArray:[NSArray ascendArray:[self.param2String componentsSeparatedByString:@"~"]] toAnotherOrderedArray:[NSArray ascendArray:[self.param1String componentsSeparatedByString:@"~"]]];
            
            self.showDebugResultLabel.text = [self LeetCode1Service_getDebugResultStringWithNumbersList:mergedList];
        }
            break;
            
        default:
            break;
    }
}

//MARK:-------------------------------------------------------------------------Getters & Setters
- (NHMarkdownView *)mdView {
    if (_mdView == nil) {
        _mdView = [[NHMarkdownView alloc] init];
        _mdView.backgroundColor = kWhiteColor;
        _mdView.layer.cornerRadius = kWIDTH_SCALE(8.f);
        _mdView.layer.masksToBounds = YES;
        _mdView.layer.borderColor = kRgbAColor(210, 211, 212, 1).CGColor;
        _mdView.layer.borderWidth = kWIDTH_SCALE(.5f);
        _mdView.openOnSafari = YES;
        _mdView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _mdView;
}

- (LeetCodeInputParamTextField *)inputParam1TextField {
    if (_inputParam1TextField == nil) {
        _inputParam1TextField = [[LeetCodeInputParamTextField alloc] init];
        _inputParam1TextField.returnKeyType = UIReturnKeyDone;
        _inputParam1TextField.delegate = self;
    }
    
    return _inputParam1TextField;
}

- (LeetCodeInputTipLabel *)inputTip1Label {
    if (_inputTip1Label == nil) {
        _inputTip1Label = [[LeetCodeInputTipLabel alloc] init];
        _inputTip1Label.status = LeetCodeInputTipLabelStatusDefault;
    }
    
    return _inputTip1Label;
}

- (LeetCodeInputParamTextField *)inputParam2TextField {
    if (_inputParam2TextField == nil) {
        _inputParam2TextField = [[LeetCodeInputParamTextField alloc] init];
        _inputParam2TextField.returnKeyType = UIReturnKeyDone;
        _inputParam2TextField.delegate = self;
    }
    
    return _inputParam2TextField;
}

- (LeetCodeInputTipLabel *)inputTip2Label {
    if (_inputTip2Label == nil) {
        _inputTip2Label = [[LeetCodeInputTipLabel alloc] init];
        _inputTip2Label.status = LeetCodeInputTipLabelStatusDefault;
    }
    
    return _inputTip2Label;
}

- (LeetCodeShowDebugResultLabel *)showDebugResultLabel {
    if (_showDebugResultLabel == nil) {
        _showDebugResultLabel = [[LeetCodeShowDebugResultLabel alloc] init];
        _showDebugResultLabel.textColor = kRgbAColor(48, 53, 67, 1);
        _showDebugResultLabel.font = kSYSTEM_FONT(16.f);
        _showDebugResultLabel.textAlignment = NSTextAlignmentCenter;
        _showDebugResultLabel.layer.cornerRadius = kWIDTH_SCALE(4.f);
        _showDebugResultLabel.layer.masksToBounds = YES;
        _showDebugResultLabel.layer.borderColor = kRgbAColor(48, 53, 67, 1).CGColor;
        _showDebugResultLabel.layer.borderWidth = kWIDTH_SCALE(.5f);
    }
    
    return _showDebugResultLabel;
}

- (LeetCodeDebugButton *)debugButton {
    if (_debugButton == nil) {
        _debugButton = [LeetCodeDebugButton buttonWithType:UIButtonTypeCustom];
        _debugButton.backgroundColor = kRgbAColor(48, 53, 67, 1);
        [_debugButton setTitle:@"DEBUG" forState:UIControlStateNormal];
        [_debugButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        _debugButton.titleLabel.font = kBOLD_SYSTEM_FONT(15.f);
        _debugButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _debugButton.layer.cornerRadius = kWIDTH_SCALE(4.f);
        _debugButton.layer.masksToBounds = YES;
        [_debugButton addTarget:self action:@selector(debugButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _debugButton;
}

- (void)setType:(LeetCodeDetailUIToolType)type {
    _type = type;
    
    switch (type) {
        case LeetCodeDetailUIToolTypeSuject_1:
        {
            self.inputParam1TextField.placeholder = @"请输入整型数字，并用英文~分隔";
            self.inputParam2TextField.placeholder = @"请输入目标整形数字";
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_5:
        {
            self.inputParam1TextField.placeholder = @"请输入括号字符串，eg:{(()[]]{}";
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            self.inputParam1TextField.placeholder = @"请输入一个整数";
        }
            break;
        case LeetCodeDetailUIToolTypeSuject_10:
        {
            self.inputParam1TextField.placeholder = @"请输入整型数字，并用英文~分隔";
            self.inputParam2TextField.placeholder = @"请输入整型数字，并用英文~分隔";
        }
            break;
            
        default:
            break;
    }
}

@end
