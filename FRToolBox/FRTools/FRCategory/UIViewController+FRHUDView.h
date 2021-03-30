//
//  UIViewController+FRHUDView.h
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FRHUDView)

/// 显示 Text
- (void)showHUDText:(NSString *)text;
/// Loading && Text 加载中和文本
- (void)showHUDWaitingTitle:(nullable NSString *)title;
/// Loading && Text && info 加载中和文本和详情
- (void)showHUDWaitingTitle:(nullable NSString *)title details:(NSString *)detail;
- (void)hideHUDView;    // 隐藏提示


/// 设置导航栏标题颜色
- (void)setNavigationTitleColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
