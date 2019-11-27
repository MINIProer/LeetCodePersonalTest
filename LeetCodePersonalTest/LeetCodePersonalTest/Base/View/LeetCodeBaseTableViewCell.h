//
//  LeetCodeBaseTableViewCell.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodeBaseTableViewCell : UITableViewCell

/**
 *  初始化默认配置
 */
- (void)setupDefaultConfig;

/**
 *  初始化子控件
 */
- (void)setupSubViews;

/**
 *  初始化约束
 */
- (void)setupConstraints;

@end

NS_ASSUME_NONNULL_END
