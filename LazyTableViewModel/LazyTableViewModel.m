//
//  LazyTableViewModel.m
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import "LazyTableViewModel.h"

@interface LazyTableViewModel () <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UIView *headView;
@end

@implementation LazyTableViewModel
-(void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _sectionViewModels = [NSMutableArray arrayWithCapacity:0];
    _viewModels = [NSMutableArray array];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 65;
}
- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionViewModels.count ? self.sectionViewModels.count : self.viewModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.viewController respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [self.viewController tableView:tableView numberOfRowsInSection:section];
    }
    return self.viewModels.count > section ? [self.viewModels[section] count]:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LazyCellModel *cellModel = [[self.viewModels objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cellModel.tableView = tableView;
    LazyCell *cell = nil;
    if (cell == nil) {
        cell = [cellModel cell];    }
    cell.model = cellModel.model;
    return cell;
}
#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!self.sectionViewModels.count) {
        return nil;
    }
    LazyHeaderViewModel *headerModel = [self.sectionViewModels objectAtIndex:section];
    if (headerModel && [headerModel isKindOfClass:[LazyHeaderViewModel class]]) {
        LazyHeaderView *headerView = headerModel.view;
        headerView.section = section;
        return headerModel.view;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (!self.sectionViewModels.count) {
        return 0.01;
    }
    LazyHeaderViewModel *headerModel = [self.sectionViewModels objectAtIndex:section];
    if (headerModel && [headerModel isKindOfClass:[LazyHeaderViewModel class]]) {
        return headerModel.view.frame.size.height;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor clearColor];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.viewController respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.viewController tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.viewController respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.viewController tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}
@end
