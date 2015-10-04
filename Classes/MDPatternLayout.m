//
//  MDPatternLayout.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternLayout.h"
#import "MDPatternTileView.h"

@interface MDPatternLayout ()

@end

@implementation MDPatternLayout

-(instancetype)init
{
    if(self = [super init])
    {
        _patternTypesDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)registerClass:(Class)viewClass forPatternItemType:(NSString *)patternType
{
    if(![viewClass isSubclassOfClass:[MDPatternTileView class]])
    {
        [NSException raise:@"Invalid view class" format:@"View class should be a subclass of MDPatternView"];
    }
    
    [_patternTypesDictionary setValue:viewClass forKey:patternType];
}
-(Class)viewClassForPatternItemType:(NSString *)patternItemType
{
    Class viewClass = [_patternTypesDictionary valueForKey:patternItemType];
    return viewClass;
}

-(NSArray<MDPatternLayoutItem*>*)layoutItems
{
    return [NSArray array];
}
@end
