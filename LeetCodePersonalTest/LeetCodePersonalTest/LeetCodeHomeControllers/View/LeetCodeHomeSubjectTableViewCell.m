//
//  LeetCodeHomeSubjectTableViewCell.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeHomeSubjectTableViewCell.h"

// Tool
#import "LJMacroDefinition.h"

// Pod
#import <Masonry/Masonry.h>

@interface LeetCodeHomeSubjectTableViewCell ()

/** 容器视图View */
@property (nonatomic, strong) UIView *containerView;

/** 题目标题Label */
@property (nonatomic, strong) UILabel *subjectTitleLabel;

@end

@implementation LeetCodeHomeSubjectTableViewCell

//MARK:-------------------------------------------------------------------------Init(初始化方法)
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubViews];
        
        [self setupConstraints];
    }
    
    return self;
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)setupSubViews {
    [super setupSubViews];
    
    [self.contentView addSubview:self.containerView];
    
    [self.containerView addSubview:self.subjectTitleLabel];
}

- (void)setupConstraints {
    [super setupConstraints];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f)));
    }];
    
    [self.subjectTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
    }];
}

//MARK:-------------------------------------------------------------------------Getters & Setters
- (UIView *)containerView {
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = kWhiteColor;
        _containerView.layer.cornerRadius = kWIDTH_SCALE(10.f);
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.borderColor = kRgbAColor(210, 211, 212, 1).CGColor;
        _containerView.layer.borderWidth = kWIDTH_SCALE(.5f);
    }
    
    return _containerView;
}

- (UILabel *)subjectTitleLabel {
    if (_subjectTitleLabel == nil) {
        _subjectTitleLabel = [[UILabel alloc] init];
        _subjectTitleLabel.textColor = kRgbAColor(53, 54, 55, 1);
        _subjectTitleLabel.font = kBOLD_SYSTEM_FONT(20.f);
        _subjectTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_subjectTitleLabel sizeToFit];
    }
    
    return _subjectTitleLabel;
}

- (void)setIsFirst:(BOOL)isFirst {
    _isFirst = isFirst;
    
    if (isFirst) {
        
        [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f)));
        }];
        
    } else {
        
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f)));
        }];
    }
}

- (void)setIsLast:(BOOL)isLast {
    _isLast = isLast;
    
    if (isLast) {
        
        [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(10.f)));
        }];
        
    } else {
        
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f), kWIDTH_SCALE(5.f), kWIDTH_SCALE(10.f)));
        }];
    }
}

- (void)setSubjectTitleString:(NSString *)subjectTitleString {
    _subjectTitleString = subjectTitleString;
    
    self.subjectTitleLabel.text = subjectTitleString;
}

@end
