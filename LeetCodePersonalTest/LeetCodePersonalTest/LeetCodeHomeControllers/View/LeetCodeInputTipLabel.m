//
//  LeetCodeInputTipLabel.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/26.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeInputTipLabel.h"

// Tool
#import "LJMacroDefinition.h"

@implementation LeetCodeInputTipLabel

- (instancetype)init {
    if (self = [super init]) {
        
        self.font = kSYSTEM_FONT(10.f);
        self.textAlignment = NSTextAlignmentLeft;
        [self sizeToFit];
    }
    
    return self;
}

- (void)setStatus:(LeetCodeInputTipLabelStatus)status {
    
    switch (status) {
        case LeetCodeInputTipLabelStatusDefault:
        {
            self.text = @"等待校验";
            self.textColor = kRgbAColor(48, 53, 67, 1);
        }
            break;
        case LeetCodeInputTipLabelStatusSuccess:
        {
            self.text = @"校验通过";
            self.textColor = [UIColor greenColor];
            
        }
            break;
        case LeetCodeInputTipLabelStatusFailed:
        {
            self.text = @"校验失败，请检查输入参数格式，并重新输入";
            self.textColor = [UIColor redColor];
        }
            break;
        default:
            break;
    }
}

@end
