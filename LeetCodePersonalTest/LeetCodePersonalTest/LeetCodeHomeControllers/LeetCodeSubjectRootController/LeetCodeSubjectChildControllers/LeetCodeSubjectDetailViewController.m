//
//  LeetCodeSubjectDetailViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/28.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeSubjectDetailViewController.h"

// Tool
#import "LeetCodeDetailUITool.h"

// Category
#import "LeetCodeDetailUITool+Service.h"

@interface LeetCodeSubjectDetailViewController ()

/** 习题详情页业务组件工具 */
@property (nonatomic, strong) LeetCodeDetailUITool *detailUITool;

@end

@implementation LeetCodeSubjectDetailViewController

//MARK:-------------------------------------------------------------------------LifeCycle(生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNotificationObserver];
    
    if (self.shouldBlankViewShow) return;
    
    [self.detailUITool setupUIWithType:((int)self.subjectIndex + 1) superView:self.view];
    
    [self.detailUITool loadHTMLStringWithSubjectIndex:(int)self.subjectIndex];
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
    
    [self.detailUITool LeetCodeService_keyboardWillShow:notification];
}

- (void)keyboardWillHidden:(NSNotification *)notification {
    
    [self.detailUITool LeetCodeService_keyboardWillHidden:notification];
}

//MARK:-------------------------------------------------------------------------Getters & Setters
- (LeetCodeDetailUITool *)detailUITool {
    if (_detailUITool == nil) {
        _detailUITool = [[LeetCodeDetailUITool alloc] init];
    }
    
    return _detailUITool;
}

@end
