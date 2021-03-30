//
//  UIViewController+FRAdd.m
//  FRRecordBill
//
//  Created by sonny on 2021/3/17.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import "UIViewController+FRAdd.h"

#import <STPopup.h>

@implementation UIViewController (FRAdd)










- (void)__popupBottomSheetController:(UIViewController *)subpage {
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:subpage];
    popupController.style = STPopupStyleBottomSheet;
    [popupController presentInViewController:self];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());// 快醒醒，别睡了
}
- (void)__popupSheetController:(UIViewController *)subpage {
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:subpage];
    popupController.style = STPopupStyleFormSheet;//STPopupStyleFormSheet;STPopupStyleBottomSheet
//    popupController.containerView.layer.cornerRadius = 10;// 设置弹出式圆角
    [popupController presentInViewController:self];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());// 快醒醒，别睡了
}
- (void)__hidePopupNavigationBar {
    [self.popupController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.popupController.navigationBar setShadowImage:[UIImage new]];// 导航栏的线
}
/// 弹窗点击其他区域自动消失，调用 - (void)__clickPopupBackgroundView;
- (void)__autoCancelWhenTapPopupBackground {
    [self.popupController.backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__clickPopupBackgroundView)]];
}
- (void)__clickPopupBackgroundView {
    [self.popupController dismiss];
    CFRunLoopWakeUp(CFRunLoopGetCurrent());// 快醒醒，别睡了
}




@end
