//
//  UIImageView+FRAdd.h
//  FRWeather
//
//  Created by sonny on 2020/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^FRGenerateQRCodeImageCompletionBlock)(UIImage *image);

@interface UIImageView (FRAdd)

/// 生成二维码图片,回调可为空
- (void)setQRCodeImageWithInputString:(NSString *)string width:(CGFloat)width completed:(nullable FRGenerateQRCodeImageCompletionBlock)completedBlock;

@end

NS_ASSUME_NONNULL_END
