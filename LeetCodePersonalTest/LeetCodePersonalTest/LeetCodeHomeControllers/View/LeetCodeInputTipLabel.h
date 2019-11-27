//
//  LeetCodeInputTipLabel.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/26.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeBaseLabel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LeetCodeInputTipLabelStatus) {
    LeetCodeInputTipLabelStatusDefault,
    LeetCodeInputTipLabelStatusSuccess,
    LeetCodeInputTipLabelStatusFailed
};

@interface LeetCodeInputTipLabel : LeetCodeBaseLabel

@property (nonatomic, assign) LeetCodeInputTipLabelStatus status;

@end

NS_ASSUME_NONNULL_END
