//
//  MDPatternView.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDPatternView;

@protocol MDPatternViewDelegate <NSObject>

//notify delegate that it was tapped
-(void)patternViewDidTap:(MDPatternView*)patternView;

@end

@interface MDPatternView : UIView
{
    @protected
    CAShapeLayer *maskLayer;
    CAShapeLayer *borderLayer;
}

//delegate
@property(nonatomic,weak)id<MDPatternViewDelegate> delegate;

//border width
@property(nonatomic,assign)CGFloat                 borderWidth;

//border color
@property(nonatomic,retain)UIColor                 *borderColor;

//override this method in subclasses to define the shape of the pattern view as CGPathRef
-(CGPathRef)maskPath;
@end
