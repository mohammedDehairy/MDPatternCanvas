//
//  MDPatternTile.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/4/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternTileView.h"

@interface MDPatternTileView ()

@end

@implementation MDPatternTileView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //create the CAShapeLayer
        maskLayer = [CAShapeLayer layer];
        maskLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        
        
        //set the path of the CAShapeLayer
        CGPathRef path = [self maskPath];
        maskLayer.path = path;
        
        
        //border layer with the same path
        borderLayer = [CAShapeLayer layer];
        [borderLayer setPath:path];
        CFRelease(path);
        [borderLayer setLineWidth:2.0f];
        [borderLayer setStrokeColor:[UIColor blackColor].CGColor];
        [borderLayer setFillColor:[UIColor clearColor].CGColor];
        borderLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);;
        [self.layer addSublayer:borderLayer];
        
        
        //set the CAShapeLayer as the mask layer of self
        self.layer.mask = maskLayer;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return CGPathContainsPoint(maskLayer.path, NULL, point, false);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //ignore more than one touch at the same time
    if(touches.count > 1)
    {
        return;
    }
    
    //make sure when the touch ends that its location is within the mask layer bounds , if not ignore it
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    if(!CGPathContainsPoint(maskLayer.path, NULL, location, false))
    {
        return;
    }
    
    if([_delegate respondsToSelector:@selector(patternViewDidTap:)])
    {
        [_delegate patternViewDidTap:self];
    }
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [borderLayer setStrokeColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    [borderLayer setLineWidth:borderWidth];
}

-(CGPathRef)maskPath
{
    return nil;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
