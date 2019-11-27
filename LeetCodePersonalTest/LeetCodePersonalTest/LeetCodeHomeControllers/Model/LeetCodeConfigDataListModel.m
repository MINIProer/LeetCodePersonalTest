//
//  LeetCodeConfigDataListModel.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/27.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "LeetCodeConfigDataListModel.h"
#import "LeetCodeConfigDataModel.h"

@implementation LeetCodeConfigDataListModel

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"list" : [LeetCodeConfigDataModel class]
             };
}

@end
