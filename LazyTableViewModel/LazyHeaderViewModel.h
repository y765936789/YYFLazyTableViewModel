//
//  LazyHeaderViewModel.h
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LazyHeaderView.h"

@interface LazyHeaderViewModel : NSObject
@property (assign, nonatomic) Class viewClass;
@property (strong, nonatomic) id model;
@property (assign, nonatomic) CGRect frame;
@property (readonly, nonatomic, getter=view) LazyHeaderView *view;

+(LazyHeaderViewModel *)lazyHeaderModelWith:(Class)viewClass
                                      model:(id)model;
+(LazyHeaderViewModel *)lazyHeaderModelWith:(Class)viewClass
                                      frame:(CGRect)frame
                                      model:(id)model;
@end
