//
//  UINavigationController+FRAdd.m
//  FRRecordBill
//
//  Created by sonny on 2021/3/15.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import "UINavigationController+FRAdd.h"

@implementation UINavigationController (FRAdd)

- (NSMutableArray *)removeViewControllers:(NSArray<NSString *> *)classArray animated:(BOOL)animated {
    
    NSMutableArray *mArray = [NSMutableArray array];
    NSArray<UIViewController *> *vcArray = self.viewControllers;
    for (UIViewController *vc in vcArray) {
        if ([classArray containsObject:NSStringFromClass(vc.class)]) {
            continue;
        }
        [mArray addObject:vc];
    }
    [self setViewControllers:mArray animated:animated];
    return mArray;
}



@end
