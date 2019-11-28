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

@interface LeetCodeDetailUITool () <UITextFieldDelegate>

/** <UI属性> **/

/** 校验提示文案Label */
@property (nonatomic, strong) LeetCodeInputTipLabel *inputTipLabel;

/** 目标数字参数校验提示文案Label */
@property (nonatomic, strong) LeetCodeInputTipLabel *targetNumberTipLabel;

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
    
    switch (type) {
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            [superView addSubview:self.mdView];
            
            [superView addSubview:self.inputParamTextField];
            
            [superView addSubview:self.inputTipLabel];
            
            [superView addSubview:self.showDebugResultLabel];
            
            [superView addSubview:self.debugButton];
        }
            break;
            
        default:
            break;
    }
}

//MARK:根据类型添加约束
- (void)setupConstraintsWithType:(LeetCodeDetailUIToolType)type superView:(UIView *)superView {
    
    switch (type) {
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            [self.mdView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(superView).insets(UIEdgeInsetsMake(kScreenTopHeight + kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                make.height.mas_equalTo(kWIDTH_SCALE(250.f));
            }];
            
            [self.inputParamTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mdView.mas_bottom).offset(kWIDTH_SCALE(30.f));
                make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
                make.height.mas_equalTo(kWIDTH_SCALE(35.f));
            }];
            
            [self.inputTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.inputParamTextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
                make.left.equalTo(self.inputParamTextField);
            }];
            
            [self.showDebugResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.inputParamTextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
                make.left.right.equalTo(superView).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
            }];
            
            [self.debugButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.showDebugResultLabel.mas_bottom).offset(kWIDTH_SCALE(30.f));
                make.bottom.equalTo(superView).offset(-kWIDTH_SCALE(10.f));
                make.centerX.equalTo(superView);
                make.size.mas_equalTo(CGSizeMake(kScreenWidth - kWIDTH_SCALE(20.f), kWIDTH_SCALE(35.f)));
            }];
        }
            break;
            
        default:
            break;
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
    
    switch (self.type) {
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            if (textField == self.inputParamTextField) {
                
                self.param1String = subString;
                
                if ([NSString isEmptyString:self.param1String]) {
                    
                    self.inputTipLabel.status = LeetCodeInputTipLabelStatusDefault;
                }
                
            }
        }
            break;
            
        default:
            break;
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
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            if ([LeetCodePredicateTool isValidIntegerString:self.param1String]) {
        
                self.inputTipLabel.status = LeetCodeInputTipLabelStatusSuccess;
                
            } else {
        
                self.inputTipLabel.status = LeetCodeInputTipLabelStatusFailed;
                
                return;
            }
            
            self.showDebugResultLabel.text = [self LeetCode8Service_isPalindrome:[self.param1String intValue]] ? [NSString stringWithFormat:@"%@：是回文数", self.param1String] : [NSString stringWithFormat:@"%@：不是回文数", self.param1String];
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

- (LeetCodeInputParamTextField *)inputParamTextField {
    if (_inputParamTextField == nil) {
        _inputParamTextField = [[LeetCodeInputParamTextField alloc] init];
        _inputParamTextField.returnKeyType = UIReturnKeyDone;
        _inputParamTextField.delegate = self;
    }
    
    return _inputParamTextField;
}

- (LeetCodeInputTipLabel *)inputTipLabel {
    if (_inputTipLabel == nil) {
        _inputTipLabel = [[LeetCodeInputTipLabel alloc] init];
        _inputTipLabel.status = LeetCodeInputTipLabelStatusDefault;
    }
    
    return _inputTipLabel;
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
        case LeetCodeDetailUIToolTypeSuject_8:
        {
            self.inputParamTextField.placeholder = @"请输入一个整数";
        }
            break;
            
        default:
            break;
    }
}

@end
