//
//  UIView+ResuseIdentifie.m
//  Demo
//
//  Created by 叶一帆 on 2018/1/17.
//  Copyright © 2018年 guanKaiTech.com. All rights reserved.
//

#import "UIView+ResuseIdentifie.h"
static NSMutableDictionary *__AppViewIdentifier = nil;
#define __AppViewStorageMaxCountL1 10
#define __AppViewStorageMaxCountL2 10

@implementation UIView (ResuseIdentifie)

+ (UIView *)dequeueReusableWithFrame:(CGRect)frame {
    NSString *identifier = [NSString stringWithFormat:@"%@",NSStringFromClass([self class])];
    return [self dequeueReusableViewWithIdentifier:identifier frame:frame];
}

+ (UIView *)dequeueReusableViewWithIdentifier:(NSString *)identifier frame:(CGRect)frame {
    if (__AppViewIdentifier !=  nil) {
        if (__AppViewIdentifier.count>__AppViewStorageMaxCountL1) {
            [__AppViewIdentifier removeAllObjects];
        }
        NSMutableArray *identItems = [__AppViewIdentifier valueForKey:identifier];
        if (identItems.count>__AppViewStorageMaxCountL2) {
            [__AppViewIdentifier removeObjectForKey:identifier];
            identItems = nil;
        }
        
        __block UIView *view = nil;
        [identItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx , BOOL *stop){
            if ([(UIView *)obj superview] == nil) {
                view = obj;
                *stop = YES;
            }
        }];
        if (view) {
            if (!CGRectEqualToRect(CGRectZero, frame)) {
                view.frame = frame;
            }
            return view;
        }
    }
    return [[[self class] alloc] initWithFrame:frame
                                reuseIdentifie:identifier];
    
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (UIView *)initWithFrame:(CGRect)frame reuseIdentifie:(NSString *)identifier {
    
    NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil];
    self = (UIView *)[nibView firstObject];
    self.frame = frame;
    if (self) {
        if (__AppViewIdentifier == nil) {
            __AppViewIdentifier = [[NSMutableDictionary alloc] initWithCapacity:0];
        }
        @synchronized(__AppViewIdentifier){
            NSMutableArray *identItems = [__AppViewIdentifier valueForKey:identifier];
            if (identItems && identItems.count>0) {
                for (UIView *view in identItems) {
                    if (view.superview == nil) {
                        return view;
                    }
                }
                [identItems addObject:self];
            }else {
                identItems = [NSMutableArray arrayWithCapacity:0];
                [identItems addObject:self];
                [__AppViewIdentifier setValue:identItems forKey:identifier];
            }
        }
    }
    return self;
}
#pragma clang diagnostic pop

+ (void)removeReusableViews {
    [__AppViewIdentifier removeAllObjects];
    __AppViewIdentifier = nil;
}

+ (void)removeReusableViewWithIdentifier:(NSString *)identifier {
    if ([__AppViewIdentifier count]>0) {
        [__AppViewIdentifier removeObjectForKey:identifier];
    }
}
@end
