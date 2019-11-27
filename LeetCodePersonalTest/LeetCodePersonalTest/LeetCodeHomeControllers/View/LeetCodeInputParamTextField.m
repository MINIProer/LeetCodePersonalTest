//
//  LeetCodeInputParamTextField.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/26.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeInputParamTextField.h"

// Tool
#import "LJMacroDefinition.h"

@implementation LeetCodeInputParamTextField

- (instancetype)init {
    if (self = [super init]) {
        
        UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH_SCALE(10.f), kWIDTH_SCALE(35.f))];
        paddingView1.backgroundColor = kWhiteColor;
        self.leftView = paddingView1;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.textColor = kRgbAColor(53, 54, 55, 1);
        self.layer.cornerRadius = kWIDTH_SCALE(4.f);
        self.layer.masksToBounds = YES;
        self.layer.borderColor = kRgbAColor(210, 211, 212, 1).CGColor;
        self.layer.borderWidth = kWIDTH_SCALE(.5f);
    }
    
    return self;
}

@end
