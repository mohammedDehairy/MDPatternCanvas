//
//  MDPatternLayout.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "MDPatternLayout.h"
#import "MDPatternView.h"

@interface MDPatternLayout ()
@property(nonatomic,retain)NSMutableDictionary *patternTypesDictionary;
@end

@implementation MDPatternLayout
-(void)registerClass:(Class)viewClass forPatternItemType:(NSString *)patternType
{
    if(![viewClass isSubclassOfClass:[MDPatternView class]])
    {
        [NSException raise:@"Invalid view class" format:@"View class should be a subclass of MDPatternView"];
    }
    
    [_patternTypesDictionary setValue:viewClass forKey:patternType];
}
-(Class)viewClassForPatternItemType:(NSString *)patternItemType
{
    return [_patternTypesDictionary valueForKey:patternItemType];
}

-(NSArray<MDPatternLayoutItem*>*)layoutItems
{
    return [NSArray array];
}
@end
