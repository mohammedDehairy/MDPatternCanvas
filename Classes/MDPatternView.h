//
//  MDPatternView.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDPatternView : UIView
{
    @protected
    CAShapeLayer *maskLayer;
}

//override this method in subclasses to define the shape of the pattern view as CGPathRef
-(CGPathRef)maskPath;
@end
