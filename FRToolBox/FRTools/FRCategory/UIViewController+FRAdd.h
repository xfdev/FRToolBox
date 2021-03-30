//
//  UIViewController+FRAdd.h
//  FRRecordBill
//
//  Created by sonny on 2021/3/17.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FRAdd)





/// 弹出 PopupController
- (void)__popupBottomSheetController:(UIViewController *)subpage;
- (void)__popupSheetController:(UIViewController *)subpage;
- (void)__hidePopupNavigationBar;
/// 弹窗点击其他区域自动消失，调用 - (void)__clickPopupBackgroundView;
- (void)__autoCancelWhenTapPopupBackground;





@end

NS_ASSUME_NONNULL_END
