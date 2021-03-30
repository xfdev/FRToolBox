//
//  UIViewController+FRHUDView.m
//  FRHere
//
//  Created by sonny on 2020/6/10.
//  Copyright © 2020 I, Robot. xfdev. All rights reserved.
//

#import "UIViewController+FRHUDView.h"

#import <MBProgressHUD.h>

@implementation UIViewController (FRHUDView)

- (void)showHUDText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud) {
        hud.mode = MBProgressHUDModeText;
    } else {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.numberOfLines = 0;
        hud.mode = MBProgressHUDModeText;
    }
    
    hud.label.text = text;
    // Move to bottm center.
    //    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:1.8f];
}
- (void)showHUDWaitingTitle:(NSString *)title {
    
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud) {
        hud.mode = MBProgressHUDModeIndeterminate;// default, loading
    } else {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    
    hud.label.text = title;
}
- (void)showHUDWaitingTitle:(NSString *)title details:(NSString *)detail {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud) {
        hud.mode = MBProgressHUDModeIndeterminate;// default, loading
    } else {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    
    hud.label.text = title;
    // Set the details label text. Let's make it multiline this time.
    hud.detailsLabel.text = detail;
}
- (void)hideHUDView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}





- (void)setNavigationTitleColor:(UIColor *)color {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
    // 设置tintColor 改变自定图片颜色
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

@end
