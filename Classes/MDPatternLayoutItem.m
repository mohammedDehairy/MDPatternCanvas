//
//  MDPatternLayoutItem.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternLayoutItem.h"

@interface MDPatternLayoutItem ()

@end

@implementation MDPatternLayoutItem
-(instancetype)initWithTileType:(NSString*)type frame:(CGRect)frame
{
    if(self = [super init])
    {
        _patternTileType  = type;
        _frame            = frame;
    }
    return self;
}
@end
