//
//  FRMacro.h
//  FRRecordBill
//
//  Created by sonny on 2021/1/7.
//  Copyright © 2021 I, Robot. xfdev. All rights reserved.
//

#ifndef FRMacro_h
#define FRMacro_h

#define SCREEN_WIDTH        YYScreenSize().width
#define SCREEN_HEIGHT       YYScreenSize().height

#define FRLeftWidth         (SCREEN_WIDTH-0)

#define FRScaleHeight(h)    h/812.0f*SCREEN_HEIGHT
#define FRScaleWidth(w)     w/375.0f*SCREEN_WIDTH



/// 状态栏高度
#define kStatusBarHeight FR_SafeAreaTop()

/// 状态栏高度 和 导航栏高度(这个宏是计算出来的，要加括号)
#define kStatusAndNavBarHeight (FR_SafeAreaTop() + 44)

#define kEdgeInsetsTopNavBar    UIEdgeInsetsMake(0, 0, 0, 0)

/// Precise 精确的 年-秒
#define FRDateFormatPrecise     @"yyyy-MM-dd HH:mm:ss"// 年月日 时分秒
#define FRDateFormat_Y_M_D_H_M  @"yyyy-MM-dd HH:mm"// 年月日 时分
#define FRDateFormat_Y_M_D      @"yyyy-MM-dd"// 年月日
#define FRDateFormat_Y_M        @"yyyy-MM"// 年月
#define FRDateFormat_M_D        @"MM-dd"// 月日
#define FRDateFormat_M_D_H_M_S  @"MM-dd HH:mm:ss"// 月日 时分秒
#define FRDateFormat_M_D_H_M    @"MM-dd HH:mm"// 月日 时分
#define FRDateFormat_H_M_S      @"HH:mm:ss"// 是分秒
#define FRDateFormat_H_M        @"HH:mm"// 时分


// 项目字体
#define FRFontOfSize(f)     [UIFont systemFontOfSize:f] // 项目中字体
#define FRBoldFontOfSize(f) [UIFont boldSystemFontOfSize:f] // 加粗字体

/// hex 十六进制字符串值。a的处理过程为：此时a值为十六进制，把a截取出来，%X 转换成十进制，然后除以 255 作为 alpha 的值
#define FRColorHex(hex)     UIColorHex(hex)         // rgba,a和0-1的alpha不一样，
// 文字类颜色 LCColor
#define FRColorTheme        UIColorHex(000)       // 项目中主题颜色
#define FRColor333          UIColorHex(333333)       // 项目中黑色
#define FRColor666          UIColorHex(666666)       // 项目中中黑色
#define FRColor999          UIColorHex(999999)       // 项目中灰色
#define FRColorBlack        UIColorHex(303030)      // 项目中黑色
#define FRColorLightBlack   UIColorHex(AFADC5)      // 浅黑色
#define FRColorBgLine       UIColorHex(F2F2F2)
#define FRColorRed          UIColorHex(e74242)       // 项目中红色
#define FRColorSystemClear  [UIColor clearColor]
#define FRColorSystemWhite  [UIColor whiteColor]
#define FRColorSystemBlack  [UIColor blackColor]        // 0.0 white


#define FRAutoDarkBackgroundColorWithView(view) \
[self autoDarkBackgroundColorWithView:view];


// Singleton: FRSingletonH()
#define FRSingletonH(name)  + (instancetype)shared##name;
#define FRSingletonM(name)  \
static id _instance = nil;  \
\
+ (instancetype)shared##name {  \
    static dispatch_once_t once;    \
    dispatch_once(&once, ^{         \
        _instance = [[self alloc] init];    \
    }); \
    return _instance;   \
}   \
+ (instancetype)allocWithZone:(struct _NSZone *)zone {  \
    static dispatch_once_t once;    \
    dispatch_once(&once, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance;   \
}   \
- (instancetype)copyWithZone:(struct _NSZone *)zone {   \
    return _instance;   \
}   \
- (instancetype)mutableCopyWithZone:(struct _NSZone *)zone {    \
    return _instance;   \
}





#ifndef __OPTIMIZE__
    #define NSLog(xx, ...)      NSLog(@"打印日志: %s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define NSLog(xx, ...)      ((void)0)
#endif



#define YYModelSynthCoderAndHash \
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; } \
- (id)initWithCoder:(NSCoder *)aDecoder { return [self yy_modelInitWithCoder:aDecoder]; } \
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; } \
- (NSUInteger)hash { return [self yy_modelHash]; } \
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; } \
- (NSString *)description { return [self yy_modelDescription]; }


#endif /* FRMacro_h */

// 状态栏高度，非全面屏20.0，全面屏44.0
static inline CGFloat FR_SafeAreaTop() {
    CGFloat temp = 20;
    
    if (@available(iOS 11.0, *)) {
        temp = UIApplication.sharedApplication.keyWindow.safeAreaInsets.top;
    }
    return temp;
}

// 底部距离，非全面屏0，全面屏34
static inline CGFloat FR_SafeAreaBottom() {
    CGFloat temp = 0;
    
    if (@available(iOS 11.0, *)) {
        temp = UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom;
    }
    return temp;
}

/**
 判断 iPhoneX，这个方法有一定弊端，比如在keyWindow没有创建的时候，UIApplication初始化的时候判断，但概率较小；
 这里有多种方法：https://stackoverflow.com/questions/46192280/detect-if-the-device-is-iphone-x
 最保险的方法就是获取设备 machineModel，@"iPhone12,1" 这种结果，然后手动判断是否全面屏
 这里列举了多种方法的优缺点：https://kangzubin.com/iphonex-detect/
 */
static inline BOOL is_iPhoneX() {
    return FR_SafeAreaBottom() > 0;
}


/// 计算比例高度
/// @param OriginalSize 原始大小，原图大小
/// @param DynamicWidth 动态宽度
static inline CGFloat FR_ScaleHeight(CGSize OriginalSize, CGFloat DynamicWidth) {
//    width/ = DynamicWidth/
//    height    H
    // 动态宽*高 = 宽*未知高
    return DynamicWidth*OriginalSize.height/OriginalSize.width;
}
/// 计算比例宽度。动态高*宽 = 高*未知宽
static inline CGFloat FR_ScaleWidth(CGSize OriginalSize, CGFloat DynamicHeight) {
    return DynamicHeight*OriginalSize.width/OriginalSize.height;
}

/** Masonry 更新布局动画
 // tell constraints they need updating ：告诉约束他们需要更新
 [self setNeedsUpdateConstraints];

 // update constraints now so we can animate the change ：现在更新约束，以便我们可以对更改进行动画处理
 [self updateConstraintsIfNeeded];

 [UIView animateWithDuration:0.4 animations:^{
     [self layoutIfNeeded];
 }];
 */

/// View 类似键盘弹出的动画
static inline void FR_View_Animations(void (^ __nonnull animationsBlock)(void), void (^ __nullable completionBlock)(BOOL finished)) {
    UIViewAnimationOptions animationOptions = 7 << 16;
    [UIView animateWithDuration:0.25 delay:0 options:animationOptions animations:animationsBlock completion:completionBlock];
}

/**
 可否为空的几种修饰：
 1.typedef 声明的block：
 typedef void(^FRLoginActionBlock)(FRLoginActionType type, NSDictionary * _Nullable param);
 typedef void (^SDAsyncBlock)(SDAsyncBlockOperation * __nonnull asyncOperation);// 不为空
 
 2.block 作为参数(task 为返回值可为空，来自AFNetwork)
 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
 
 3.block 的返回值 (void (^)(void))
 ompletion:(void (^)(id _Nullable parameters))block;
 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
 
 4.方法参数
 -parameters:(nullable id)parameters
 
 5. 返回值
 - (nullable NSURLSessionDataTask *)POST {}
 
 
 */





