//
//  UIView2.h
//  Andrew Lim
//
//  Copyright (c) 2013-2015 Andrew Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (UIView2Additions)

-(void) setX:(CGFloat) x;
-(void) setY:(CGFloat) y;
-(void) setWidth:(CGFloat) w  ;
-(void) setHeight:(CGFloat) h ;
-(void) setSizeWithWidth:(CGFloat)w height:(CGFloat) h ;
-(void) setSize:(CGSize) size ;
-(void) setFrameX:(CGFloat) x ;
-(void) setFrameY:(CGFloat) y ;
-(void) setLocationX:(CGFloat) x y:(CGFloat) y ;
-(void) translateX:(CGFloat) x
                 y:(CGFloat) y ;
-(void) moveToParentBottom ;
-(void) moveBelow:(UIView*) b
               by:(CGFloat) cy ;
-(void) moveAbove:(UIView*) b
               by:(CGFloat) cy ;
-(void) moveRightAfter:(UIView*) a
                    by:(CGFloat) c;
-(void) alignLeft:(UIView*) b;
-(void) alignTop:(UIView*) b;
-(void) alignRight:(UIView*) b;
-(void) centerHorizontally ;
-(void) centerVertically ;
-(NSString*) frameDesc;
-(CGFloat) bottom;
-(CGFloat) right;

+(CGRect) screenRect;

@end
