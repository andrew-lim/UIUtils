//
//  UIUtils.m
//  BigHouse
//
//  Created by Andrew Lim on 3/17/15.
//  Copyright (c) 2015 InterApp Pluz Sdn. Bhd. All rights reserved.
//

#import "UIUtils.h"

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

+(void) scrollViewContentSizeToFit:(UIScrollView *)scrollView {
    CGRect contentRect = CGRectZero;
    for (UIView *view in scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    scrollView.contentSize = contentRect.size;
}

@end
