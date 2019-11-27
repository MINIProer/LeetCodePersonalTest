//
//  LeetCodeConfigDataModel.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeetCodeConfigDataModel : NSObject

/** 课题名称 */
@property (nonatomic, strong) NSString *subject_name;

/** 是否存在习题解析【0:不存在、1:存在】 */
@property (nonatomic, assign) NSInteger analysis_exist;

/** 习题详情页名称 */
@property (nonatomic, strong) NSString *subject_scheme;

@end

NS_ASSUME_NONNULL_END
