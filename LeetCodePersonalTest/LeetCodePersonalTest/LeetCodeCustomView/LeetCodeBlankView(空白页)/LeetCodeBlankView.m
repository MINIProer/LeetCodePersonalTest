//
//  LeetCodeBlankView.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBlankView.h"

//Tool
#import "LJMacroDefinition.h"

//Category
#import "UIView+Category.h"
#import "NSString+Category.h"

//Pod
#import <Masonry/Masonry.h>

@interface LeetCodeBlankView ()

/** 空白页图片 */
@property (nonatomic, strong) UIImageView *blankImageView;

/** 空白页提示文案 */
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation LeetCodeBlankView

//MARK:-------------------------------------------------------------------------Init(初始化方法)
- (instancetype)init {
    if (self = [super init]) {
        
        [self setupSubViews];
        
        [self setupConstraints];
    }
    
    return self;
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)setupSubViews {
    
    [self addSubview:self.blankImageView];
    
    [self addSubview:self.tipLabel];
}

- (void)setupConstraints {
    
    [self.blankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kWIDTH_SCALE(189.f));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kWIDTH_SCALE(150.f), kWIDTH_SCALE(119.f)));
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blankImageView.mas_bottom).offset(kWIDTH_SCALE(30.f));
        make.centerX.equalTo(self.blankImageView);
    }];
}

//MARK:-------------------------------------------------------------------------Getters & Setters
- (UIImageView *)blankImageView {
    if (_blankImageView == nil) {
        _blankImageView = [[UIImageView alloc] init];
        _blankImageView.image = [UIImage imageNamed:@"icons8-cloud-binary-code-100"];
        _blankImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _blankImageView;
}

- (UILabel *)tipLabel {
    if (_tipLabel == nil) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = kRgbAColor(48, 53, 67, 1);
        _tipLabel.font = kBOLD_SYSTEM_FONT(20.f);
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [_tipLabel sizeToFit];
    }
    
    return _tipLabel;
}

- (void)setType:(LeetCodeBlankViewType)type {
    _type = type;
    
    switch (type) {
        case LeetCodeBlankViewTypeDefault:
        {
            self.blankImageView.image = [UIImage imageNamed:@"icons8-cloud-binary-code-100"];
            self.tipLabel.text = @"暂无习题解析";
        }
            break;
        default:
            break;
    }
}

@end
