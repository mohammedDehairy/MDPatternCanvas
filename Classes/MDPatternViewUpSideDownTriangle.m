//
//  MDPatternViewUpSideDownTriangle.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternViewUpSideDownTriangle.h"

@implementation MDPatternViewUpSideDownTriangle

-(CGPathRef)maskPath
{
    //create an up side down triangle path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, 0.0);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width, 0);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width/2, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0.0, 0.0);
    
    return path;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
