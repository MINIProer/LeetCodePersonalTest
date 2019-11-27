//
//  LeetCode_1_ViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCode_1_ViewController.h"

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
#import "LeetCode_1_ViewController+Service.h"

// Pod
#import <Masonry/Masonry.h>

// Framework
#import <NHMarkdown/NHMarkdown-Swift.h>
#import <WebKit/WebKit.h>

@interface LeetCode_1_ViewController () <UITextFieldDelegate>

/** <UI属性> **/

/** 数组参数校验提示文案Label */
@property (nonatomic, strong) LeetCodeInputTipLabel *numbersTipLabel;

/** 目标数字参数校验提示文案Label */
@property (nonatomic, strong) LeetCodeInputTipLabel *targetNumberTipLabel;

/** 编译结果Label */
@property (nonatomic, strong) LeetCodeShowDebugResultLabel *showDebugResultLabel;

/** 提交调试按钮Button */
@property (nonatomic, strong) LeetCodeDebugButton *debugButton;

/** <计算属性> **/

/**整型数组字符串 */
@property (nonatomic, strong) NSString *numbersString;

/**目标数值字符串 */
@property (nonatomic, strong) NSString *targetNumberString;

@end

@implementation LeetCode_1_ViewController

//MARK:-------------------------------------------------------------------------LifeCycle(生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNotificationObserver];
    
    [self setupSubViews];
    
    [self setupConstraints];
    
    [self loadHTMLString];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeNotificationObserver];
}

//MARK:-------------------------------------------------------------------------UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *subString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField == self.numbersTextField) {
        
        self.numbersString = subString;
        
        if ([NSString isEmptyString:self.numbersString]) {
            
            self.numbersTipLabel.status = LeetCodeInputTipLabelStatusDefault;
        }
        
    } else if (textField == self.targetNumberTextField) {
        
        self.targetNumberString = subString;
        
        if ([NSString isEmptyString:self.targetNumberString]) {
            
            self.targetNumberTipLabel.status = LeetCodeInputTipLabelStatusDefault;
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)setupDefaultConfig {
    [super setupDefaultConfig];
    
    self.thirdKeybordDealFuncTime = 0;
}

- (void)setupSubViews {
    [super setupSubViews];
    
    [self.view addSubview:self.mdView];
    
    [self.view addSubview:self.numbersTextField];
    
    [self.view addSubview:self.numbersTipLabel];
    
    [self.view addSubview:self.targetNumberTextField];
    
    [self.view addSubview:self.targetNumberTipLabel];

    [self.view addSubview:self.debugButton];
    
    [self.view addSubview:self.showDebugResultLabel];
}

- (void)setupConstraints {
    [super setupConstraints];

    [self.mdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(kScreenTopHeight + kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
        make.height.mas_equalTo(kWIDTH_SCALE(250.f));
    }];
    
    [self.numbersTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mdView.mas_bottom).offset(kWIDTH_SCALE(30.f));
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
        make.height.mas_equalTo(kWIDTH_SCALE(35.f));
    }];
    
    [self.numbersTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numbersTextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
        make.left.equalTo(self.numbersTextField);
    }];
    
    [self.targetNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numbersTextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
        make.height.mas_equalTo(kWIDTH_SCALE(35.f));
    }];
    
    [self.targetNumberTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.targetNumberTextField.mas_bottom).offset(kWIDTH_SCALE(2.f));
        make.left.equalTo(self.targetNumberTextField);
    }];
    
    [self.showDebugResultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.targetNumberTextField.mas_bottom).offset(kWIDTH_SCALE(30.f));
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, kWIDTH_SCALE(10.f), 0, kWIDTH_SCALE(10.f)));
    }];
    
    [self.debugButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showDebugResultLabel.mas_bottom).offset(kWIDTH_SCALE(30.f));
        make.bottom.equalTo(self.view).offset(-kWIDTH_SCALE(10.f));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth - kWIDTH_SCALE(20.f), kWIDTH_SCALE(35.f)));
    }];
}

- (void)loadHTMLString {
    
    NSString *content = [self getLocalContentWithSubjectNumber:1];

    [self.mdView loadWithMarkdown:content completionHandler:^(WKWebView * _Nonnull wkWeb, WKNavigation * _Nullable wkNav) {

    }];
}

- (void)debugButtonClickAction {
    
    if ([LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.numbersString]) {
        
        self.numbersTipLabel.status = LeetCodeInputTipLabelStatusSuccess;
        
    } else {
        
        self.numbersTipLabel.status = LeetCodeInputTipLabelStatusFailed;
    }
    
    if ([LeetCodePredicateTool isValidNumberString:self.targetNumberString]) {
        
        self.targetNumberTipLabel.status = LeetCodeInputTipLabelStatusSuccess;
        
    } else {
        
        self.targetNumberTipLabel.status = LeetCodeInputTipLabelStatusFailed;
    }
    
    if (![LeetCodePredicateTool isValidCommaSeparatedNumbersListString:self.numbersString] || ![LeetCodePredicateTool isValidNumberString:self.targetNumberString]) return;
    
    NSArray *indexList = [self LeetCode1Service_findTheIndexListWithNumbers:[self.numbersString componentsSeparatedByString:@"~"] targetNumber:[self.targetNumberString intValue]];
    
    self.showDebugResultLabel.text = [self LeetCode1Service_getDebugResultStringWithNumbersList:indexList];
}

- (void)addNotificationObserver {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeNotificationObserver {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)notification {

    [self LeetCode1Service_keyboardWillShow:notification];
}

- (void)keyboardWillHidden:(NSNotification *)notification {

    [self LeetCode1Service_keyboardWillHidden:notification];
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

- (LeetCodeInputParamTextField *)numbersTextField {
    if (_numbersTextField == nil) {
        _numbersTextField = [[LeetCodeInputParamTextField alloc] init];
        _numbersTextField.placeholder = @"请输入整型数字，并用英文~分隔";
        _numbersTextField.returnKeyType = UIReturnKeyDone;
        _numbersTextField.delegate = self;
    }
    
    return _numbersTextField;
}

- (LeetCodeInputTipLabel *)numbersTipLabel {
    if (_numbersTipLabel == nil) {
        _numbersTipLabel = [[LeetCodeInputTipLabel alloc] init];
        _numbersTipLabel.status = LeetCodeInputTipLabelStatusDefault;
    }
    
    return _numbersTipLabel;
}

- (LeetCodeInputParamTextField *)targetNumberTextField {
    if (_targetNumberTextField == nil) {
        _targetNumberTextField = [[LeetCodeInputParamTextField alloc] init];
        _targetNumberTextField.placeholder = @"请输入目标整形数字";
        _targetNumberTextField.returnKeyType = UIReturnKeyDone;
        _targetNumberTextField.delegate = self;
    }
    
    return _targetNumberTextField;
}

- (LeetCodeInputTipLabel *)targetNumberTipLabel {
    if (_targetNumberTipLabel == nil) {
        _targetNumberTipLabel = [[LeetCodeInputTipLabel alloc] init];
        _targetNumberTipLabel.status = LeetCodeInputTipLabelStatusDefault;
    }
    
    return _targetNumberTipLabel;
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

@end
