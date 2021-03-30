//
//  UINavigationController+FRAdd.h
//  FRRecordBill
//
//  Created by sonny on 2021/3/15.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (FRAdd)

- (NSMutableArray *)removeViewControllers:(NSArray<NSString *> *)classArray animated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
