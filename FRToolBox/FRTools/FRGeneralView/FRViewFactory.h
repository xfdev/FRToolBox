//
//  FRViewFactory.h
//  FRToolBox
//
//  Created by sonny on 2021/3/30.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRViewFactory : NSObject

/// numberOfLines=0，textAlignment = .Center
+ (UILabel *)labelWithText:(nullable NSString *)text font:(CGFloat)size textColor:(UIColor *)color;
+ (UILabel *)labelWithText:(nullable NSString *)text bfont:(CGFloat)size textColor:(UIColor *)color;
/// 文字按钮
+ (UIButton *)titleButton:(NSString *)title font:(CGFloat)size textColor:(UIColor *)color;
/// 图片按钮
+ (UIButton *)imageButtonWithNormal:(NSString *)norName selected:(nullable NSString *)selName target:(nullable id)target action:(SEL)action;
/// 主题按钮
+ (UIButton *)themeButtonTitle:(NSString *)title target:(id)target action:(SEL)action;

/// .contentMode = .AspectFill;
+ (UIImageView *)imageViewWithName:(nullable NSString *)name;
/// .contentMode = .AspectFit;
+ (UIImageView *)fitImageViewWithName:(nullable NSString *)name;

/// returnKeyType = UIReturnKeyDone;
+ (UITextField *)textFieldWithPlaceholder:(nullable NSString *)placeholder font:(CGFloat)size color:(UIColor *)textColor delegate:(nullable id<UITextFieldDelegate>)delegate;

/// UITableViewStylePlain Tableview，estimatedRowHeight 小于0为不设置，使用默认值default is UITableViewAutomaticDimension
+ (UITableView *)tableViewDelegate:(id <UITableViewDelegate, UITableViewDataSource>)delegate estimatedHeight:(CGFloat)estimatedRowHeight;


/// 温度曲线 https://stackoverflow.com/a/25324819
/// @param points @(point)，
+ (UIBezierPath *)quadCurvedPathWithPoints:(NSArray *)points;

@end

NS_ASSUME_NONNULL_END
