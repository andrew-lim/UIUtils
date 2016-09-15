//
//  UIView2.h
//  Andrew Lim.
//
//  Copyright (c) 2013-2015 Andrew Lim.. All rights reserved.
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
-(CGFloat) boundsWidth ;
-(CGFloat) boundsHeight ;
-(void) translateX:(CGFloat) x
                 y:(CGFloat) y ;
-(void) moveToParentBottom ;
-(void) moveToParentRight ;
-(void) moveBelow:(UIView*) b
               by:(CGFloat) cy ;
-(void) moveAbove:(UIView*) b
               by:(CGFloat) cy ;
-(void) moveRightAfter:(UIView*) a
                    by:(CGFloat) c;
-(void) moveLeftBefore:(UIView*) a
                    by:(CGFloat) c;
-(void) alignLeft:(UIView*) b;
-(void) alignTop:(UIView*) b;
-(void) alignRight:(UIView*) b;
-(void) valignCenter:(UIView*) b;
-(void) centerHorizontally ;
-(void) centerVertically ;
-(NSString*) frameDesc;
-(CGFloat) bottom;
-(CGFloat) right;
-(void) expand:(CGFloat) length;
-(void) expandbyLeft:(CGFloat) left
                 top:(CGFloat) top
               right:(CGFloat) right
              bottom:(CGFloat) bottom;
-(CGRect) rectThatFitsSubviews;
+(CGRect) screenRect;

@end
