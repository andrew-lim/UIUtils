//
//  UIView2.h
//  Andrew Lim
//
//  Copyright (c) 2013-2015 Andrew Lim. All rights reserved.
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

@interface UIUtils : NSObject


@end
