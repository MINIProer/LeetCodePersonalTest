//
//  LeetCodeBlankView.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LeetCodeBlankViewType) {
    LeetCodeBlankViewTypeDefault
};

@interface LeetCodeBlankView : UIView

/** 空白页类型 */
@property (nonatomic, assign) LeetCodeBlankViewType type;

@end

NS_ASSUME_NONNULL_END
