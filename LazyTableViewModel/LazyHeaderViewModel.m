//
//  LazyHeaderViewModel.m
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import "LazyHeaderViewModel.h"
#import "UIView+ResuseIdentifie.h"

@implementation LazyHeaderViewModel
-(LazyHeaderView *)view {
    if (_viewClass && [_viewClass isSubclassOfClass:[LazyHeaderView class]]) {
        LazyHeaderView *view = nil;
        view = (LazyHeaderView *)[_viewClass dequeueReusableWithFrame:_frame];
        view.model = self.model;
        return view;
    }
    return nil;
}
+(LazyHeaderViewModel *)lazyHeaderModelWith:(Class)viewClass
                                      model:(id)model {
    return [LazyHeaderViewModel lazyHeaderModelWith:viewClass
                                              frame:CGRectZero
                                              model:model];
}
+(LazyHeaderViewModel *)lazyHeaderModelWith:(Class)viewClass
                                      frame:(CGRect)frame
                                      model:(id)model {
    LazyHeaderViewModel *headerModel = [[LazyHeaderViewModel alloc] init];
    if (viewClass) {
        [headerModel setViewClass:viewClass];
        [headerModel setFrame:frame];
        [headerModel setModel:model];
    }
    return headerModel;
}
@end
