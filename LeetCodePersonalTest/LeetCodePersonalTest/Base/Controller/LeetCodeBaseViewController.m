//
//  LeetCodeBaseViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseViewController.h"

// Tool
#import "LJMacroDefinition.h"

@interface LeetCodeBaseViewController ()

@end

@implementation LeetCodeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDefaultConfig];
    
    [self setupSubViews];
    
    [self setupConstraints];
}

//MARK:初始化默认配置
- (void)setupDefaultConfig {
    
    self.view.backgroundColor = kWhiteColor;
}

//MARK:初始化子控件
- (void)setupSubViews {
    
}

//MARK:初始化约束
- (void)setupConstraints {
    
}

//MARK:获取本地的markdown文档内容
- (NSString *)getLocalContentWithSubjectNumber:(int)subjectNumber {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"LeetCodeSubject-%d.md", subjectNumber] ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    return content;
}

@end
