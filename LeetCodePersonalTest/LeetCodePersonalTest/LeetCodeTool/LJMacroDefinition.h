//
//  LJMacroDefinition.h
//  LanJingerNew
//
//  Created by lg-hms on 2019/3/5.
//  Copyright © 2019 HuangMS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIColor+Category.h"

typedef void (^LJArrayBlock)(NSMutableArray *resultArray);

/** 获取系统时间戳 */
#define kCurentTime                     [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

/** keyWindow */
#define kKeyWindow                      [UIApplication sharedApplication].keyWindow

/** 避免循环引用 */
#define kWEAK_SELF __weak               typeof(self)weakSelf = self;

//MARK:------------------------------------------------------------------网络相关
/** 一次性判断是否有网的宏 */
#define kIsNetwork                      [LJNetWorkAPI isNetwork]
/** 一次性判断是否为手机网络的宏 */
#define kIsWWANNetwork                  [LJNetWorkAPI isWWANNetwork]
/** 一次性判断是否为WiFi网络的宏 */
#define kIsWiFiNetwork                  [LJNetWorkAPI isWiFiNetwork]

//MARK:------------------------------------------------------------------日志相关
#define LJLog(...)                      printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

//MARK:------------------------------------------------------------------设备相关
/** 判断设备 */
#define kIS_Iphone5                     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define kIS_IphoneX                     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIS_IphoneXR                    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define kIS_IphoneXSMAX                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IsiPhone11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone11Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone11ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define kIS_IphoneXAll                  ((kIS_IphoneX || kIS_IphoneXR || kIS_IphoneXSMAX) ? YES : NO)

//判断屏幕
#define Is480Screen (kScreenHeight == 480.0)     // iPhone4,4s
#define Is568Screen (kScreenHeight == 568.0)     // iPhone5,5s
#define Is667Screen (kScreenHeight == 667.0)     // 4.7, iPhone6
#define Is960Screen (kScreenHeight == 736.0)     // 5.5, iPhone6+

//MARK:-------------------------------------------------------------------UI相关
/** 屏幕的宽度 */
#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                   [UIScreen mainScreen].bounds.size.height
/** 屏幕的尺寸 */
#define kScreenSize                     [UIScreen mainScreen].bounds.size

/** 动态距离 */
#define kWIDTH_SCALE(_value_)           (kScreenWidth / 375.0f * (_value_))

/** 状态条高度 */
#define kStatusBarHeight                ((kIS_IphoneXAll) ? (44) : (20))

/** 导航条高度 */
#define kNavHeight                      44

/** 状态条 + 导航条高度 */
#define kScreenTopHeight                ((kIS_IphoneXAll) ? (44 + 44) : (44 + 20))

/** Tabbar高度 */
#define kTabbarHeight                   ((kIS_IphoneXAll) ? (49 + 34) : (49))

//MARK:------------------------------------------------------------------颜色相关
/** 自定义颜色RGB */
#define kRgbColor(r, g, b)              [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define kRgbAColor(r, g, b, a)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kRandomColor                    [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
#define kRGBColor16Bit(str) [UIColor colorWithHexString:str]
 
/** 各控件主题颜色 */
#define kViewBackgroundColor            kRgbColor(239, 239, 244)
#define kTintColor                      kRgbColor(0, 102, 94)

#define kBlackColor                     kRgbColor(0, 0, 0)
#define kWhiteColor                     kRgbColor(255, 255, 255)
#define kWhiteAColor                    kRgbAColor(255, 255, 255, 0.5)

//MARK:------------------------------------------------------------------字体相关
/** 系统字体 正常字体 */
#define kSYSTEM_FONT(__value__)         [UIFont systemFontOfSize:(__value__)]
/** 系统字体 加粗字体 */
#define kBOLD_SYSTEM_FONT(__value__)    [UIFont boldSystemFontOfSize:(__value__)]

//MARK:------------------------------------------------------------------TODO宏定义

#define LJ_STRINGIFY(S) #S
#define LJ_DEFER_STRINGIFY(S) LJ_STRINGIFY(S)
#define LJ_PRAGMA_MESSAGE(MSG) _Pragma(LJ_STRINGIFY(message(MSG)))
#define LJ_FORMATTED_MESSAGE(MSG) "[TODO-" LJ_DEFER_STRINGIFY(__COUNTER__) "] " ""MSG " \n" LJ_DEFER_STRINGIFY(__FILE__) " line " LJ_DEFER_STRINGIFY(__LINE__)
#define LJ_KEYWORDIFY @try {} @catch (...) {}

#define LJ_TODO(MSG) LJ_KEYWORDIFY LJ_PRAGMA_MESSAGE(LJ_FORMATTED_MESSAGE(MSG))

//MARK:--------------------------------------------------------------App和设备信息
/** app名称 */
#define kAppName                        [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleDisplayName"]
/** app版本 */
#define kAppVersion                     [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"]
/** 手机型号 */
#define kPhoneModel                     [[UIDevice currentDevice] model];
/** 手机序列号 */
#define kPhoneIdentifierNumber          [[UIDevice currentDevice] uniqueIdentifier]
/** 手机别名 */
#define kUserPhoneName                  [[UIDevice currentDevice] name];
/** 系统版本 */
#define kSystemVersion                  [UIDevice currentDevice].systemVersion.floatValue
/** 设备名称 */
#define kDeviceName                     [[UIDevice currentDevice] systemName]
