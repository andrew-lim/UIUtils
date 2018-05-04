//
//  UIUtils.m
//  BigHouse
//
//  Created by Andrew Lim. on 3/17/15.
//  Copyright (c) 2015 InterApp Pluz Sdn. Bhd. All rights reserved.
//

#import "UIUtils.h"

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation UIUtils


// This method scales an image. Use it to scale a high-resolution image to a smaller one.
// http://stackoverflow.com/questions/7645454/resize-uiimage-by-keeping-aspect-ratio-and-width
+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;

    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;

    // See skornos comment in the stackoverflow page
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0);

    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToHeight: (float) i_height
{
    float oldHeight = sourceImage.size.height;
    float scaleFactor = i_height / oldHeight;

    float newHeight = oldHeight * scaleFactor;
    float newWidth = sourceImage.size.width * scaleFactor;

    // See skornos comment in the stackoverflow page
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newWidth, newHeight), NO, 0);

    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage*) imageNamed:(NSString*) name scaledToWidth: (float) width {
    UIImage* img = [UIImage imageNamed:name];
    if ( img.size.width != width ) {
        img = [UIUtils imageWithImage:img scaledToWidth:width];
    }
    return img;
}

+(UIImage*) imageNamed:(NSString*) name scaledToHeight: (float) height {
    UIImage* img = [UIImage imageNamed:name];
    if ( img.size.height != height ) {
        img = [UIUtils imageWithImage:img scaledToHeight:height];
    }
    return img;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize deviceScale:(BOOL) deviceScale {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, deviceScale ? 0.0 : 1.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)imageWithImage:(UIImage*) image
    alpha:(CGFloat) alpha
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);

    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);

    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);

    CGContextSetAlpha(ctx, alpha);

    CGContextDrawImage(ctx, area, image.CGImage);

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return newImage;
}

+(void) alert:(NSString*) msg
        title:(NSString*) title {
    UIAlertView *alert = [[UIAlertView alloc]
                           initWithTitle: title
                           message: msg
                           delegate: nil
                           cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

+(void) alertController:(UIViewController*) ctrl
                    msg: (NSString*) msg
                  title:(NSString*) title {
    UIAlertController * alertCtrl =  [UIAlertController alertControllerWithTitle:title
                                                                         message:msg
                                                                  preferredStyle:UIAlertControllerStyleAlert
                                      ];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                   }];
    [alertCtrl addAction:cancelAction];
    [ctrl presentViewController:alertCtrl animated:YES completion:^{
        ALog(@"");
    }];
}

+(void) scrollViewContentSizeToFit:(UIScrollView *)scrollView {
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    scrollView.contentSize = contentRect.size;
}

+(void) scrollViewContentSizeToFit:(UIScrollView *)scrollView
                     bottomPadding:(CGFloat) padding {
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    contentRect.size.height += padding;
    scrollView.contentSize = contentRect.size;
}

+(void) stackViews:(NSMutableArray*) views
        horizontal:(BOOL) horizontal
           spacing:(CGFloat) spacing {
    UIView* prevView = nil;
    for ( int i=0; i<views.count; ++i ) {
        UIView* view = [views objectAtIndex:i];
        if ( prevView ) {
            if ( horizontal ) {
                [view moveRightAfter:prevView by:spacing];
            }
            else {
                [view moveBelow:prevView by:spacing];
            }
        }
        prevView = view;
    }
}

+ (NSString *)htmlFromBodyString:(NSString *)htmlBodyString
                        textFont:(UIFont *)font
                       textColor:(UIColor *)textColor
{
    int numComponents = (int)CGColorGetNumberOfComponents([textColor CGColor]);

    NSAssert(numComponents == 4 || numComponents == 2, @"Unsupported color format");

    // E.g. FF00A5
    NSString *colorHexString = nil;

    const CGFloat *components = CGColorGetComponents([textColor CGColor]);

    if (numComponents == 4)
    {
        unsigned int red = components[0] * 255;
        unsigned int green = components[1] * 255;
        unsigned int blue = components[2] * 255;
        colorHexString = [NSString stringWithFormat:@"%02X%02X%02X", red, green, blue];
    }
    else
    {
        unsigned int white = components[0] * 255;
        colorHexString = [NSString stringWithFormat:@"%02X%02X%02X", white, white, white];
    }

    NSString *HTML = [NSString stringWithFormat:@"<html>\n"
                      "<head>\n"
                      "<style type=\"text/css\">\n"
                      "body {font-family: \"%@\"; font-size: %@; color:#%@;}\n"
                      "</style>\n"
                      "</head>\n"
                      "<body>%@</body>\n"
                      "</html>",
                      font.familyName, @(font.pointSize), colorHexString, htmlBodyString];

    return HTML;
}

+(void) fixUIWebViewDelay:(UIWebView*) webView {
    // https://medium.com/@mihai/disabling-the-click-delay-in-uiwebview-5cd6b18a8c19
    for (UIView* view in webView.scrollView.subviews) {
        // UIWebBrowserView
        if ([view.class.description hasPrefix:@"UIWebBrowse"] && [view.class.description hasSuffix:@"rView"]) {
            for (UIGestureRecognizer *gestureRecognizer in view.gestureRecognizers) {
                if ([gestureRecognizer isKindOfClass:UITapGestureRecognizer.class]) {
                    ALog(@"Disabling UITapGestureRecognizer");
                    UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *) gestureRecognizer;
                    if (tapRecognizer.numberOfTapsRequired == 2 && tapRecognizer.numberOfTouchesRequired == 1) {
                        tapRecognizer.enabled = NO;
                        break;
                    }
                }
            }
            break;
        }
    }
}

@end
