//
//  UIView2.h
//  Andrew Lim.
//
//  Copyright (c) 2013-2015 Andrew Lim.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView2.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

@interface UIUtils : NSObject

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;
+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToHeight: (float) i_height;
+(UIImage*) imageNamed:(NSString*) name scaledToWidth: (float) width;
+(UIImage*) imageNamed:(NSString*) name scaledToHeight: (float) height;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize deviceScale:(BOOL) deviceScale;
+ (UIImage*)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithImage:(UIImage*) image
                      alpha:(CGFloat) alpha;

+(void) alert:(NSString*) msg
        title:(NSString*) title;

// https://stackoverflow.com/questions/30129278/keyboard-pops-up-after-uialertview-is-dismissed-on-ios-8-3-for-ipad
+(void) alertController:(UIViewController*) ctrl
                    msg: (NSString*) msg
                  title:(NSString*) title;


+(void) scrollViewContentSizeToFit:(UIScrollView*) scrollView;
+(void) scrollViewContentSizeToFit:(UIScrollView *)scrollView
                     bottomPadding:(CGFloat) padding;
+(void) stackViews:(NSMutableArray*) views
        horizontal:(BOOL) horizontal
           spacing:(CGFloat) spacing;

+ (NSString *)htmlFromBodyString:(NSString *)htmlBodyString
                        textFont:(UIFont *)font
                       textColor:(UIColor *)textColor;

+(void) fixUIWebViewDelay:(UIWebView*) webView;

@end
