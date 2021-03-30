//
//  UIView+FRAdd.m
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import "UIView+FRAdd.h"

@implementation UIView (FRAdd)

// 圆角相关
- (void)setCurrentRadii:(CGFloat)currentRadii {
    objc_setAssociatedObject(self, @selector(currentRadii), @(currentRadii), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)currentRadii {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setTopLeftAndRightRoundedCorners {
    if (self.currentRadii == 14) {
        return;
    }
    [self setRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight radiiFloat:14];
}

- (void)setRoundedCorners:(UIRectCorner)corners radiiFloat:(CGFloat)radii {
//    if (self.currentRadii == radii) {// 这里需要优化，如果这里直接 return，在tableview的header中b会被调用多次，第一次的时候并没有frame的宽度，再加上 frame 是否相等的判断？
//        return;
//    }
    self.currentRadii = radii;
    CGSize cornerRadii = CGSizeMake(radii, radii);
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = rounded.CGPath;
    self.layer.mask = shapeLayer;
}

- (void)setFrCornerRadius:(CGFloat)frCornerRadius {
    self.layer.cornerRadius = frCornerRadius;
    self.clipsToBounds = YES;
}







- (void)setBorderColor:(UIColor *)c cornerRadius:(CGFloat)r borderWidth:(CGFloat)w {
    
    [self.layer setBorderColor:c.CGColor];
    [self.layer setCornerRadius:r];
    [self.layer setBorderWidth:w];
}

// top
- (void)setFrTop:(CGFloat)frTop {
    CGRect f = self.frame;
    f.origin.y = frTop;
    self.frame = f;
}
- (CGFloat)frTop {
    return self.frame.origin.y;
}

// left
- (void)setFrLeft:(CGFloat)frLeft {
    CGRect f = self.frame;
    f.origin.x = frLeft;
    self.frame = f;
}
- (CGFloat)frLeft {
    return self.frame.origin.x;
}

// right
- (void)setFrRight:(CGFloat)frRight {
    self.frLeft = frRight - self.frWidth;
}
- (CGFloat)frRight {
    return self.frLeft + self.frWidth;
}

// bottom
- (void)setFrBottom:(CGFloat)frBottom {
    self.frTop = frBottom - self.frHeight;
}
- (CGFloat)frBottom {
    return self.frTop + self.frHeight;
}

// width
- (void)setFrWidth:(CGFloat)frWidth {
    CGRect f = self.frame;
    f.size.width = frWidth;
    self.frame = f;
}
- (CGFloat)frWidth {
    return self.frame.size.width;
}

// height
- (void)setFrHeight:(CGFloat)frHeight {
    CGRect f = self.frame;
    f.size.height = frHeight;
    self.frame = f;
}
- (CGFloat)frHeight {
    return self.frame.size.height;
}

// centerX
- (void)setFrCenterX:(CGFloat)frCenterX {
    CGPoint c = self.center;
    c.x = frCenterX;
    self.center = c;
}
- (CGFloat)frCenterX {
    return self.center.x;
}

// centerY
- (void)setFrCenterY:(CGFloat)frCenterY {
    CGPoint c = self.center;
    c.y = frCenterY;
    self.center = c;
}
- (CGFloat)frCenterY {
    return self.center.y;
}

// size
- (void)setFrSize:(CGSize)frSize {
    CGRect f = self.frame;
    f.size = frSize;
    self.frame = f;
}
- (CGSize)frSize {
    return self.frame.size;
}


- (MASViewAttribute *)fr_mas_autoBottom {
    if (@available(iOS 11.0, *)) {
        return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
    } else {
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottomMargin];
    }
}

@end
