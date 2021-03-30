//
//  UIView+FRAdd.h
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FRAdd)


@property (nonatomic, assign) CGFloat currentRadii; // .
/// 切 左上角 和 右上角圆角
- (void)setTopLeftAndRightRoundedCorners;

/// 任意方向切圆角，会使 scrollView 有问题，滑动显示不完全，要在设置Frame之后调用
/// @param corners UIRectCornerTopLeft | UIRectCornerTopRight
/// @param radii 圆角值
- (void)setRoundedCorners:(UIRectCorner)corners radiiFloat:(CGFloat)radii;

/// 圆角
- (void)setFrCornerRadius:(CGFloat)frCornerRadius;// 圆角.

/// 画边框
- (void)setBorderColor:(UIColor *)c cornerRadius:(CGFloat)r borderWidth:(CGFloat)w;


/**
 View直接设置宽width,高height,位置,x,y
 */
@property (nonatomic, assign) CGFloat frTop;
@property (nonatomic, assign) CGFloat frLeft;
@property (nonatomic, assign) CGFloat frRight;
@property (nonatomic, assign) CGFloat frBottom;
@property (nonatomic, assign) CGFloat frWidth;
@property (nonatomic, assign) CGFloat frHeight;

//@property (nonatomic, assign) CGPoint frCenter;
@property (nonatomic, assign) CGFloat frCenterX;
@property (nonatomic, assign) CGFloat frCenterY;

@property (nonatomic, assign) CGSize frSize;

// masonry 自动适应底部
@property (nonatomic, strong, readonly) MASViewAttribute *fr_mas_autoBottom;



@end

NS_ASSUME_NONNULL_END
