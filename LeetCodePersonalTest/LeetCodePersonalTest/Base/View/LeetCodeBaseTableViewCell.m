//
//  LeetCodeBaseTableViewCell.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseTableViewCell.h"

// Tool
#import "LJMacroDefinition.h"

// Pod
#import <Masonry/Masonry.h>

@implementation LeetCodeBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupDefaultConfig];
        
        [self setupSubViews];
        
        [self setupConstraints];
    }
    
    return self;
}

//MARK:初始化默认配置
- (void)setupDefaultConfig {
    
    self.backgroundColor = kRgbAColor(237, 240, 243, 1);
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

//MARK:初始化子控件
- (void)setupSubViews {
    
}

//MARK:初始化约束
- (void)setupConstraints {
    
    
}

@end
