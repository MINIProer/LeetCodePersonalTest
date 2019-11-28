//
//  LeetCode_2_ViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCode_2_ViewController.h"

// Tool
#import "LeetCodeDetailUITool.h"

// Category
#import "LeetCodeDetailUITool+Service.h"

@interface LeetCode_2_ViewController ()

@end

@implementation LeetCode_2_ViewController

//MARK:-------------------------------------------------------------------------LifeCycle(生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNotificationObserver];
    
    if (self.shouldBlankViewShow) return;
    
    [[LeetCodeDetailUITool sharedInstance] setupUIWithType:LeetCodeDetailUIToolTypeSuject_8 superView:self.view];
    
    [[LeetCodeDetailUITool sharedInstance] loadHTMLStringWithSubjectIndex:(int)self.subjectIndex];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeNotificationObserver];
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)addNotificationObserver {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeNotificationObserver {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    
    [[LeetCodeDetailUITool sharedInstance] LeetCodeService_keyboardWillShow:notification];
}

- (void)keyboardWillHidden:(NSNotification *)notification {
    
    [[LeetCodeDetailUITool sharedInstance] LeetCodeService_keyboardWillHidden:notification];
}

@end
