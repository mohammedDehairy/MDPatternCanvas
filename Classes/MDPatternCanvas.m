//
//  MDPatternCanvas.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternCanvas.h"

@implementation MDPatternCanvas

-(instancetype)initWithFrame:(CGRect)frame patternLayout:(MDPatternLayout*)patternLayout
{
    if(self = [super initWithFrame:frame])
    {
        _patternLayout = patternLayout;
        _patternLayout.patternSize = frame.size;
        
        self.clipsToBounds = YES;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 2;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray<MDPatternLayoutItem*> *layoutItems = [_patternLayout layoutItems];
    
    for(MDPatternLayoutItem *layoutItem in layoutItems)
    {
        //get item type
        NSString *itemType = layoutItem.patternItemType;
        
        //get item class
        Class viewClass    = [_patternLayout viewClassForPatternItemType:itemType];
        
        //initialise item view
        MDPatternView *view = [[viewClass alloc] initWithFrame:layoutItem.frame];
        
        //add item view as subview
        [self addSubview:view];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
