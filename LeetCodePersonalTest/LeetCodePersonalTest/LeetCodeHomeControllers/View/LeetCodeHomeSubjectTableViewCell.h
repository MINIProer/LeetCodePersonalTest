//
//  LeetCodeHomeSubjectTableViewCell.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class LeetCodeConfigDataModel;

@interface LeetCodeHomeSubjectTableViewCell : LeetCodeBaseTableViewCell

/** 配置文件Model */
@property (nonatomic, strong) LeetCodeConfigDataModel *configDataModel;

/** 控制第一个Cell的约束变化 */
@property (nonatomic, assign) BOOL isFirst;

/** 控制最后一个Cell的约束变化 */
@property (nonatomic, assign) BOOL isLast;

@end

NS_ASSUME_NONNULL_END
