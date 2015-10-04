//
//  MDTrianglePatternLayout.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDTrianglePatternLayout.h"
#import "MDTriangleUpRightPatternTileView.h"
#import "MDUpSideDownTrianglePatternTileView.h"

@implementation MDTrianglePatternLayout
-(instancetype)init
{
    if(self = [super init])
    {
        [self registerClass:[MDTriangleUpRightPatternTileView class] forPatternItemType:@"triangleUpRight"];
        [self registerClass:[MDUpSideDownTrianglePatternTileView class] forPatternItemType:@"triangleUpSideDown"];
    }
    return self;
}
-(NSArray<MDPatternLayoutItem*>*)layoutItems
{
    CGSize itemSize = CGSizeMake(self.patternSize.width/10, self.patternSize.width/10);
    
    NSMutableArray *layoutItems = [NSMutableArray array];
    
    //layout up right triangles
    for(int i = 0; i < 10; i++)
    {
        int limit = 10;
        
        CGFloat xOffset = 0;
        
        //each odd row offset x position by half item width
        if(i % 2 != 0)
        {
            limit = 11;
            xOffset = -itemSize.width/2;
        }
        
        for(int j = 0; j < limit; j++)
        {
            //get item frame
            CGRect frame = CGRectMake(j * itemSize.width + xOffset, i * itemSize.height, itemSize.width, itemSize.height);
            
            //initialise item layout
            MDPatternLayoutItem *item = [[MDPatternLayoutItem alloc] initWithItemType:@"triangleUpSideDown" frame:frame];
            
            //add item layout to array
            [layoutItems addObject:item];
        }
    }
    
    
    //layout upside down triangles
    for(int i = 0; i < 10; i++)
    {
        int limit = 10;
        
        CGFloat xOffset = 0;
        
        //each even row offset x position by half item width
        if(i % 2 == 0)
        {
            limit = 11;
            xOffset = -itemSize.width/2;
        }
        
        for(int j = 0; j < limit; j++)
        {
            //get item frame
            CGRect frame = CGRectMake(j * itemSize.width + xOffset, i * itemSize.height, itemSize.width, itemSize.height);
            
            //initialise item layout
            MDPatternLayoutItem *item = [[MDPatternLayoutItem alloc] initWithItemType:@"triangleUpRight" frame:frame];
            
            //add item layout to array
            [layoutItems addObject:item];
        }
    }
    
    
    return layoutItems;
}
@end
