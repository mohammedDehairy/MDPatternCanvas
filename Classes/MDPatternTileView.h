//
//  MDPatternTile.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/4/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDPatternTileView;

@protocol MDPatternTileViewDelegate <NSObject>

//notify delegate that it was tapped
-(void)patternViewDidTap:(MDPatternTileView*)patternTile;

@end

@interface MDPatternTileView : UIView
{
    @protected
    CAShapeLayer *maskLayer;
    CAShapeLayer *borderLayer;
}

//delegate
@property(nonatomic,weak)id<MDPatternTileViewDelegate> delegate;

//border width
@property(nonatomic,assign)CGFloat                 borderWidth;

//border color
@property(nonatomic,retain)UIColor                 *borderColor;

//override this method in subclasses to define the shape of the pattern view as CGPathRef
-(CGPathRef)maskPath;
@end
