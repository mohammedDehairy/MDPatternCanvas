//
//  MDPatternViewTriangleUpRight.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternViewTriangleUpRight.h"

@interface MDPatternViewTriangleUpRight ()
{
    
}
@end

@implementation MDPatternViewTriangleUpRight


-(CGPathRef)maskPath
{
    //create an up right triangle path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0.0, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width/2, 0);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 0.0, self.bounds.size.height);
    
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
