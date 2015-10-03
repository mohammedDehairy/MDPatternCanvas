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

@interface MDPatternCanvas : UIView
@property(nonatomic,retain)MDPatternLayout *patternLayout;

-(instancetype)initWithFrame:(CGRect)frame patternLayout:(MDPatternLayout*)patternLayout;
@end
