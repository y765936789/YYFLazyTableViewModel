//
//  LazyCellModel.m
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import "LazyCellModel.h"

@implementation LazyCellModel

-(LazyCell *)cell {
    if (_cellClass && [_cellClass isSubclassOfClass:[UITableViewCell class]]) {
        NSString *identifier = [NSString stringWithFormat:@"%@",NSStringFromClass(_cellClass)];
        LazyCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
        return cell;
    }
    return nil;
}
+(LazyCellModel *)lazyCellModelWithClass:(Class)cellClass
                                   model:(id)model {
    return [LazyCellModel lazyCellModelWithClass:cellClass
                                           model:model
                                             tag:-1];
}
+(LazyCellModel *)lazyCellModelWithClass:(Class)cellClass
                                   model:(id)model
                                     tag:(NSInteger)tag {
    LazyCellModel *cellModel = [[LazyCellModel alloc] init];
    if (cellClass) {
        [cellModel setCellClass:cellClass];
        [cellModel setModel:model];
        [cellModel setTag:tag];
    }
    return cellModel;
}

@end
