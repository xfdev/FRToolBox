//
//  FRViewFactory.m
//  FRToolBox
//
//  Created by sonny on 2021/3/30.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import "FRViewFactory.h"

@implementation FRViewFactory

+ (UILabel *)labelWithText:(NSString *)text font:(CGFloat)size textColor:(UIColor *)color {
    UILabel *label = [UILabel new];
    label.text = text;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = FRFontOfSize(size);
    label.textColor = color;
    return label;
}
+ (UILabel *)labelWithText:(NSString *)text bfont:(CGFloat)size textColor:(UIColor *)color {
    UILabel *label = [UILabel new];
    label.text = text;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = FRBoldFontOfSize(size);
    label.textColor = color;
    return label;
}

/// 文字按钮
+ (UIButton *)titleButton:(NSString *)title font:(CGFloat)size textColor:(UIColor *)color {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = FRFontOfSize(size);
    [button setTitleColor:color forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/// 图片按钮
+ (UIButton *)imageButtonWithNormal:(NSString *)norName selected:(NSString *)selName target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:norName.image forState:UIControlStateNormal];
    if (selName) {
        [button setImage:selName.image forState:UIControlStateSelected];
    }
    if (target) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

/// 主题按钮
+ (UIButton *)themeButtonTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = FRFontOfSize(18);
    [button setTitleColor:FRColorSystemWhite forState:UIControlStateNormal];
    // 彩色
    UIImage *NormalImage = [UIImage imageWithColor:FRThemeManager.themeColor size:CGSizeMake(10, 10)];
//    UIImage *NormalImage = [@"button_normal_bgimage".image stretchableImageWithLeftCapWidth:2 topCapHeight:2];
    [button setBackgroundImage:NormalImage forState:UIControlStateNormal];
    
    UIImage *DisabledImage = [@"button_disabled_bgimage".image stretchableImageWithLeftCapWidth:2 topCapHeight:2];
    [button setBackgroundImage:DisabledImage forState:UIControlStateDisabled];
//    button.backgroundColor = FRColorSystemBlack;
    button.layer.cornerRadius = 22;
    button.clipsToBounds = YES;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIImageView *)imageViewWithName:(NSString *)name {
    UIImageView *imageView = [UIImageView new];
    if (name && name.length) {
        imageView.image = [UIImage imageNamed:name];
    }
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    return imageView;
}
/// .contentMode = .AspectFit;
+ (UIImageView *)fitImageViewWithName:(NSString *)name {
    UIImageView *imageView = [UIImageView new];
    if (name && name.length) {
        imageView.image = [UIImage imageNamed:name];
    }
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder font:(CGFloat)size color:(UIColor *)textColor delegate:(id<UITextFieldDelegate>)delegate {
    
    UITextField *textField = [UITextField new];
    textField.placeholder = placeholder;
    textField.textColor = textColor;
    textField.font = FRFontOfSize(size);
    textField.delegate = delegate;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];// 文字距离最左边偏移量
    textField.leftViewMode = UITextFieldViewModeAlways;// 设置显示模式为永远显示(默认不显示)
//    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    return textField;
}

/// UITableViewStylePlain Tableview
+ (UITableView *)tableViewDelegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate estimatedHeight:(CGFloat)estimatedRowHeight {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    if (estimatedRowHeight >= 0) {
        tableView.estimatedRowHeight = estimatedRowHeight;
    }
    tableView.tableFooterView = [UIView new];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;// 默认线
    return tableView;
}





#pragma mark - 温度曲线
/// https://stackoverflow.com/a/25324819
+ (UIBezierPath *)quadCurvedPathWithPoints:(NSArray *)points {
    UIBezierPath *path = [UIBezierPath bezierPath];

    NSValue *value = points[0];
    CGPoint p1 = [value CGPointValue];
    [path moveToPoint:p1];

    if (points.count == 2) {
        value = points[1];
        CGPoint p2 = [value CGPointValue];
        [path addLineToPoint:p2];
        return path;
    }

    for (NSUInteger i = 1; i < points.count; i++) {
        value = points[i];
        CGPoint p2 = [value CGPointValue];

        CGPoint midPoint = midPointForPoints(p1, p2);
        [path addQuadCurveToPoint:midPoint controlPoint:controlPointForPoints(midPoint, p1)];
        [path addQuadCurveToPoint:p2 controlPoint:controlPointForPoints(midPoint, p2)];

        p1 = p2;
    }
    return path;
}

static CGPoint midPointForPoints(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
}

static CGPoint controlPointForPoints(CGPoint p1, CGPoint p2) {
    CGPoint controlPoint = midPointForPoints(p1, p2);
    CGFloat diffY = fabs(p2.y - controlPoint.y);
    
    if (p1.y < p2.y)
        controlPoint.y += diffY;
    else if (p1.y > p2.y)
        controlPoint.y -= diffY;

    return controlPoint;
}

@end
