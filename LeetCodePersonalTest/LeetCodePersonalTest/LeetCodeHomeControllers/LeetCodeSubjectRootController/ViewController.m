//
//  ViewController.m
//  LeetCodePersonalTest
//
//  Created by 姜书伦 on 2019/11/25.
//  Copyright © 2019 姜书伦. All rights reserved.
//

#import "ViewController.h"
#import "LeetCodeSubjectDetailViewController.h"

// View
#import "LeetCodeHomeSubjectTableViewCell.h"

// Model
#import "LeetCodeConfigDataListModel.h"
#import "LeetCodeConfigDataModel.h"

// Tool
#import "LJMacroDefinition.h"
#import "LeetCodePredicateTool.h"

// Category
#import "NSArray+Category.h"
#import "NSString+Category.h"

// Pod
#import <Masonry/Masonry.h>
#import <MJExtension/MJExtension.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

/** 题目列表 */
@property (nonatomic, strong) UITableView *tableView;

/** 配置文件数据源 */
@property (nonatomic, strong) NSDictionary *configData;

/** 列表数据源 */
@property (nonatomic, strong) NSMutableArray *configDataArrayM;

@end

@implementation ViewController

//MARK:-------------------------------------------------------------------------LifeCycle(生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LeetCode";
    
    [self setupSubViews];
    
    [self loadConfigData];
}

//MARK:-------------------------------------------------------------------------UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.configDataArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeetCodeConfigDataModel *configDataModel = self.configDataArrayM[indexPath.row];
    
    LeetCodeHomeSubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"LeetCodeHomeSubjectTableViewCell%ld", (long)indexPath.row]];
    
    if (cell == nil) {
        
        cell = [[LeetCodeHomeSubjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"LeetCodeHomeSubjectTableViewCell%ld", (long)indexPath.row]];
    }
    
    cell.configDataModel = configDataModel;
    
    if (indexPath.row == 0) {
        
        cell.isFirst = YES;
        
    } else if (indexPath.row == 9) {
        
        cell.isLast = YES;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeetCodeConfigDataModel *configDataModel = self.configDataArrayM[indexPath.row];
    
    LeetCodeSubjectDetailViewController *leetCodeDetailViewController = [[LeetCodeSubjectDetailViewController alloc] init];
    leetCodeDetailViewController.subjectIndex = indexPath.row;
    leetCodeDetailViewController.shouldBlankViewShow = configDataModel.analysis_exist ? NO : YES;
    [self.navigationController pushViewController:leetCodeDetailViewController animated:YES];
}

//MARK:-------------------------------------------------------------------------PrivateMethod(私有方法)
- (void)setupSubViews {
    
    [self.view addSubview:self.tableView];
}

- (void)loadConfigData {
    
    LeetCodeConfigDataListModel *configDataListModel = [LeetCodeConfigDataListModel mj_objectWithKeyValues:self.configData];
    
    [self.configDataArrayM removeAllObjects];
    
    [self.configDataArrayM addObjectsFromArray:configDataListModel.list];
    
    [self.tableView reloadData];
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

- (NSDictionary *)configData {
    if (_configData == nil) {
        NSString *configFilePath = [[NSBundle mainBundle] pathForResource:@"LeetCodeSubjectsConfig" ofType:@"plist"];
        _configData = [NSDictionary dictionaryWithContentsOfFile:configFilePath];
    }
    
    return _configData;
}

- (NSMutableArray *)configDataArrayM {
    if (_configDataArrayM == nil) {
        _configDataArrayM = [NSMutableArray array];
    }
    
    return _configDataArrayM;
}

@end
