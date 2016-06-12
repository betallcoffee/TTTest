//
//  TTTableViewController.m
//  TTTest
//
//  Created by liang on 11/2/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import "Masonry/Masonry.h"
#import "TTTableViewController.h"

@interface TTTableViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_expandArray;
    UITableView *_tableView;
    NSInteger _currentSection;
}

@end

@implementation TTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _expandArray = [NSMutableArray arrayWithArray:@[@(true), @(true), @(true), @(true), @(false), @(false), @(false), @(false)]];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"TTTableView"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TTTableView"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        __weak UIView *superview = _tableView.superview;
        make.edges.equalTo(superview);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSNumber *expand = _expandArray[section];
    if (expand.boolValue) {
        return 6;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TTTableView"];
    headView.textLabel.text = [NSString stringWithFormat:@"%@", @(section)];
    headView.contentView.backgroundColor = [UIColor greenColor];
    headView.tag = section;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesutre:)];
    [headView addGestureRecognizer:tapGesture];
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TTTableView"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@", @(indexPath.section), @(indexPath.row)];
    return cell;
}

#pragma mark IBAction

- (IBAction)onTapGesutre:(UITapGestureRecognizer *)sender
{
    UITableViewHeaderFooterView *headView = (UITableViewHeaderFooterView *)sender.view;
        if (headView.tag > 3 && headView.tag != _currentSection) {
            NSMutableIndexSet *sections = [[NSMutableIndexSet alloc] init];
            [sections addIndex:_currentSection];
            
            _expandArray[_currentSection] = @(false);
            _currentSection = headView.tag;
            _expandArray[_currentSection] = @(true);
            
            [sections addIndex:_currentSection];
            [_tableView reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
        } else if (headView.tag > 3 && headView.tag == _currentSection) {
            _expandArray[_currentSection] = @(false);
            NSMutableIndexSet *sections = [[NSMutableIndexSet alloc] init];
            [sections addIndex:_currentSection];
            [_tableView reloadSections:sections withRowAnimation:UITableViewRowAnimationAutomatic];
        }
}

@end
