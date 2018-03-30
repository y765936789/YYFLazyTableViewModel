//
//  UIView+ResuseIdentifie.h
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ResuseIdentifie)
+ (UIView *)dequeueReusableWithFrame:(CGRect)frame;
+ (UIView *)dequeueReusableViewWithIdentifier:(NSString *)identifier
                                        frame:(CGRect)frame;
@end
