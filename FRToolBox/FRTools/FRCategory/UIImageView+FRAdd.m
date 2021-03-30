//
//  UIImageView+FRAdd.m
//  FRWeather
//
//  Created by sonny on 2020/11/16.
//

#import "UIImageView+FRAdd.h"

@implementation UIImageView (FRAdd)


/**
inputCorrectionLevel
等级  容错率
L     7%
M     15%  默认值
Q     25%
H     30%
*/
- (void)setQRCodeImageWithInputString:(NSString *)string width:(CGFloat)width completed:(FRGenerateQRCodeImageCompletionBlock)completedBlock {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *inputData = [string dataUsingEncoding:NSUTF8StringEncoding];
        
        CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        [filter setValue:inputData forKey:@"inputMessage"];
        //    [filter setValue:@"H" forKey:@"inputCorrectionLevel"]; // 设置二维码不同级别的容错率
        CIImage *outputImage = filter.outputImage;
        
        CGFloat scale = width / CGRectGetWidth(outputImage.extent);
        CIImage *transformImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(scale, scale)];
        UIImage *image = [UIImage imageWithCIImage:transformImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

@end
