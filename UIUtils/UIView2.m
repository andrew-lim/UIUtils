//
//  UIView2.m
//  Asia Everynight
//
//  Created by Macbook on 5/14/13.
//  Copyright (c) 2013 Apps Factory. All rights reserved.
//

#import "UIView2.h"

@implementation UIView (UIView2Additions)

-(void) setX:(CGFloat) x {
    CGRect frame = self.frame ;
    frame.origin.x = x;
    self.frame = frame ;
}

-(void) setY:(CGFloat) y {
    CGRect frame = self.frame ;
    frame.origin.y = y;
    self.frame = frame ;
}

-(void) setWidth:(CGFloat) w  {
    CGRect frame = self.frame ;
    frame.size.width = w ;
    self.frame = frame ;
}

-(void) setHeight:(CGFloat) h {
    CGRect frame = self.frame ;
    frame.size.height =h ;
    self.frame = frame ;
}

-(void) setSizeWithWidth:(CGFloat)w height:(CGFloat) h {
    CGRect frame = self.frame ;
    frame.size.width = w ;
    frame.size.height = h ;
    self.frame = frame ;
}

-(void) setSize:(CGSize) size {
    CGRect frame = self.frame ;
    frame.size = size ;
    self.frame = frame ;
}

-(void) setFrameX:(CGFloat) x {
    CGRect frame = self.frame ;
    frame.origin.x = x ;
    self.frame = frame ;
}

-(void) setFrameY:(CGFloat) y {
    CGRect frame = self.frame ;
    frame.origin.y = y ;
    self.frame = frame ;
}

-(void) translateX:(CGFloat) x
                 y:(CGFloat) y {
    CGRect frame = self.frame ;
    frame.origin.x += x ;
    frame.origin.y += y ;
    self.frame = frame ;
}


-(void) setLocationX:(CGFloat) x y:(CGFloat) y {
    CGRect frame = self.frame ;
    frame.origin.x = x ;
    frame.origin.y = y ;
    self.frame = frame ;
}

-(void) moveToParentBottom {
    if ( self.superview == nil )
        return ;
    CGFloat newY = self.superview.frame.size.height - self.bounds.size.height ;
    self.frame =  CGRectMake( self.frame.origin.x, newY, self.frame.size.width, self.frame.size.height );
}

-(void) moveBelow:(UIView*) b
               by:(CGFloat) cy {
    UIView* a = self ;
    a.frame = CGRectMake( a.frame.origin.x, b.frame.origin.y+b.frame.size.height+cy, a.frame.size.width, a.frame.size.height );
}

-(void) moveAbove:(UIView*) b
               by:(CGFloat) cy {
    UIView* a = self ;
    a.frame = CGRectMake( a.frame.origin.x, b.frame.origin.y-a.frame.size.height-cy, a.frame.size.width, a.frame.size.height );
}

-(void) moveRightAfter:(UIView*) b
                    by:(CGFloat) cx {
    UIView* a = self ;
    a.frame = CGRectMake( b.frame.origin.x+b.frame.size.width+cx, a.frame.origin.y, a.frame.size.width, a.frame.size.height );
}

-(void) alignTop:(UIView*) b {
    UIView* a = self ;
    a.frame = CGRectMake( a.frame.origin.x, b.frame.origin.y, a.frame.size.width, a.frame.size.height );
}

-(void) alignLeft:(UIView*) b {
    UIView* a = self ;
    a.frame = CGRectMake( b.frame.origin.x, a.frame.origin.y, a.frame.size.width, a.frame.size.height );
}

-(void) alignRight:(UIView*) b {
    UIView* a = self ;
    a.frame = CGRectMake( b.frame.origin.x+b.frame.size.width-a.frame.size.width, a.frame.origin.y, a.frame.size.width, a.frame.size.height );
}

-(void) centerVertically{
    UIView* v = self ;

    if ( !v.superview )
        return ;

    CGFloat newY = (v.superview.frame.size.height - v.frame.size.height) / 2;

    v.frame = CGRectMake( v.frame.origin.x, newY, v.frame.size.width, v.frame.size.height );
}

-(void) centerHorizontally {
    UIView* v = self ;

    if ( !v.superview )
        return ;

    CGFloat newX = (v.superview.frame.size.width - v.frame.size.width) / 2;

    v.frame = CGRectMake( newX, v.frame.origin.y, v.frame.size.width, v.frame.size.height );
}

-(NSString*) frameDesc {
    UIView* v = self;
    return [NSString stringWithFormat:@"(%f, %f, %f, %f)", v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height];
}

-(CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}

+(CGRect) screenRect {
    CGRect rc;
    rc.origin = CGPointMake(0, 0);
    rc.size = [[UIScreen mainScreen] bounds].size;
    return rc;
}

@end
