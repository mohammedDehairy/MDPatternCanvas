//
//  MDPatternCanvas.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDPatternLayout.h"
#import "MDPatternView.h"

@class MDPatternCanvas;

@protocol MDPatternCanvasDelegate <NSObject>

//notify delegate that a pattern view was tapped
-(void)patternCanvas:(MDPatternCanvas*)patternCanvas didTapPatternView:(MDPatternView*)patternView;

@end

@interface MDPatternCanvas : UIView
//delegate
@property(nonatomic,weak)id<MDPatternCanvasDelegate> delegate;

//the pattern layout object
@property(nonatomic,retain)MDPatternLayout           *patternLayout;

//pattern border width
@property(nonatomic,assign)CGFloat                   borderWidth;

//pattern border color
@property(nonatomic,retain)UIColor                   *borderColor;

-(instancetype)initWithFrame:(CGRect)frame patternLayout:(MDPatternLayout*)patternLayout;
@end
