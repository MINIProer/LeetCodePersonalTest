//
//  ViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "ViewController.h"
#import "LeetCode_1_ViewController.h"
#import "LeetCode_2_ViewController.h"

// View
#import "LeetCodeHomeSubjectTableViewCell.h"

// Tool
#import "LJMacroDefinition.h"

// Pod
#import <Masonry/Masonry.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

/** 题目列表 */
@property (nonatomic, strong) UITableView *tableView;

/** 配置文件数据源 */
@property (nonatomic, strong) NSArray *configDataArray;

@end

@implementation ViewController

//MARK:-------------------------------------------------------------------------LifeCycle(生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LeetCode";
    
    [self setupSubViews];
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)setupSubViews {
    
    [self.view addSubview:self.tableView];
}

//MARK:-------------------------------------------------------------------------UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.configDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeetCodeHomeSubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"LeetCodeHomeSubjectTableViewCell%ld", (long)indexPath.row]];
    
    if (cell == nil) {
        
        cell = [[LeetCodeHomeSubjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"LeetCodeHomeSubjectTableViewCell%ld", (long)indexPath.row]];
    }
    
    cell.subjectTitleString = self.configDataArray[indexPath.row];
    
    if (indexPath.row == 0) {
        
        cell.isFirst = YES;
        
    } else if (indexPath.row == 9) {
        
        cell.isLast = YES;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_TODO("测试，待优化，需要根据配置文件进行跳转")
    
    if (indexPath.row == 0) {
     
        LeetCode_1_ViewController *leetCode_1_VC = [[LeetCode_1_ViewController alloc] init];
        leetCode_1_VC.shouldBlankViewShow = NO;
        [self.navigationController pushViewController:leetCode_1_VC animated:YES];
        
    } else {
        
        LeetCode_2_ViewController *leetCode_2_VC = [[LeetCode_2_ViewController alloc] init];
        leetCode_2_VC.shouldBlankViewShow = YES;
        [self.navigationController pushViewController:leetCode_2_VC animated:YES];
    }
}

//MARK:-------------------------------------------------------------------------Getters & Setters
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenTopHeight, kScreenWidth, kScreenHeight - kScreenTopHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor = kRgbAColor(237, 240, 243, 1);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = kWIDTH_SCALE(100.f);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

- (NSArray *)configDataArray {
    if (_configDataArray == nil) {
        NSString *configFilePath = [[NSBundle mainBundle] pathForResource:@"LeetCodeSubjectsConfig" ofType:@"plist"];
        _configDataArray = [NSArray arrayWithContentsOfFile:configFilePath];
    }
    
    return _configDataArray;
}

@end
