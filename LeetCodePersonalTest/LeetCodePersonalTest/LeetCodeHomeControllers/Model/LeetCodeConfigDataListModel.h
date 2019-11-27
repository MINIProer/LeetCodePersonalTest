//
//  LeetCodeConfigDataListModel.h
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LeetCodeConfigDataModel;

@interface LeetCodeConfigDataListModel : NSObject

/** 配置文件列表 */
@property (nonatomic, strong) NSArray<LeetCodeConfigDataModel *> *list;

@end

NS_ASSUME_NONNULL_END
