//
//  MDPatternCanvas.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternCanvas.h"

@interface MDPatternCanvas ()<UIScrollViewDelegate,MDPatternTileViewDelegate>
{
    UIScrollView *scrollView;
    UIView *scrollContainerView;
}
@end

@implementation MDPatternCanvas

-(instancetype)initWithFrame:(CGRect)frame patternLayout:(MDPatternLayout*)patternLayout
{
    if(self = [super initWithFrame:frame])
    {
        _patternLayout = patternLayout;
        
        
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    if(!scrollView)
    {
        //scroll view to enable zooming
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        scrollView.delegate = self;
        [scrollView setMaximumZoomScale:3.0];
        [scrollView setMinimumZoomScale:1.0];
        [self addSubview:scrollView];
    }else
    {
        scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    }
    
    
    if(!scrollContainerView)
    {
        //zoomable pattern container view
        scrollContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        scrollContainerView.layer.borderColor = _borderColor.CGColor;
        scrollContainerView.layer.borderWidth = _borderWidth/2;
        scrollContainerView.clipsToBounds     = YES;
        [scrollView addSubview:scrollContainerView];
        scrollContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    
    _patternLayout.tileSize = CGSizeMake(scrollContainerView.bounds.size.width/10, scrollContainerView.bounds.size.height/10);
    
    
    NSArray<MDPatternLayoutItem*> *layoutItems = [_patternLayout layoutItems];
    
    int tagCounter = 1000;
    
    for(MDPatternLayoutItem *layoutItem in layoutItems)
    {
        //get tile type
        NSString *tileType = layoutItem.patternTileType;
        
        //get item class
        Class viewClass    = [_patternLayout viewClassForPatternTileType:tileType];
        
        MDPatternTileView *view = (MDPatternTileView*)[scrollContainerView viewWithTag:tagCounter];
        
        if(!view)
        {
            //initialise item view
            view = [[viewClass alloc] initWithFrame:layoutItem.frame];
            [view setBorderWidth:_borderWidth/2];
            [view setBorderColor:_borderColor];
            view.tag = tagCounter;
            view.delegate = self;
            
            //add item view as subview
            [scrollContainerView addSubview:view];
            
        }else
        {
            view.frame = layoutItem.frame;
        }
        
        tagCounter++;
    }
    
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self setNeedsLayout];
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    [self setNeedsLayout];
}

#pragma mark - UIScrollViewDelegate

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return scrollContainerView;
}

#pragma mark - MDPatternViewDelegate

-(void)patternViewDidTap:(MDPatternTileView *)patternView
{
    if([_delegate respondsToSelector:@selector(patternCanvas:didTapPatternView:)])
    {
        [_delegate patternCanvas:self didTapPatternView:patternView];
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
