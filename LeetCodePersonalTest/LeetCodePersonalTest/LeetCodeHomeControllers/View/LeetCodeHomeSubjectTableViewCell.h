//
//  LeetCodeHomeSubjectTableViewCell.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodeHomeSubjectTableViewCell : LeetCodeBaseTableViewCell

/** 控制第一个Cell的约束变化 */
@property (nonatomic, assign) BOOL isFirst;

/** 控制最后一个Cell的约束变化 */
@property (nonatomic, assign) BOOL isLast;

/** 题目标题 */
@property (nonatomic, copy) NSString *subjectTitleString;

@end

NS_ASSUME_NONNULL_END
