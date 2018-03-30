//
//  LazyCellModel.h
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LazyCell.h"

@interface LazyCellModel : NSObject

@property (weak, nonatomic) UITableView *tableView;
@property (assign, nonatomic) Class cellClass;
@property (strong, nonatomic) id model;

@property (readonly, nonatomic, getter=cell) LazyCell *cell;
@property (assign, nonatomic) NSInteger tag;

+(LazyCellModel *)lazyCellModelWithClass:(Class)cellClass
                                    model:(id)model;
+(LazyCellModel *)lazyCellModelWithClass:(Class)cellClass
                                    model:(id)model
                                      tag:(NSInteger)tag;
@end
