//
//  MDPatternView.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternView.h"

@interface MDPatternView ()

@end

@implementation MDPatternView

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
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        [borderLayer setPath:path];
        CFRelease(path);
        [borderLayer setLineWidth:5.0f];
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
