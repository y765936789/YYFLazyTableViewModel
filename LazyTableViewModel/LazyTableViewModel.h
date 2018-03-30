//
//  LazyTableViewModel.h
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LazyCell.h"
#import "LazyCellModel.h"
#import "LazyHeaderViewModel.h"

@interface LazyTableViewModel : NSObject
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) id <UITableViewDelegate,UITableViewDataSource>viewController;
@property (strong, nonatomic) NSMutableArray *viewModels;
@property (strong, nonatomic) NSMutableArray *sectionViewModels;

- (void)reloadData;
@end
