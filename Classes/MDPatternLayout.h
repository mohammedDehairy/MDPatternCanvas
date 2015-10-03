//
//  MDPatternLayout.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDPatternLayoutItem.h"

@interface MDPatternLayout : NSObject
{
    @protected
    NSMutableDictionary *_patternTypesDictionary;
}
//register a MDPatternView subclass for a string identifier
-(void)registerClass:(Class)viewClass forPatternItemType:(NSString*)patternItemType;

//get the MDPatternView subclass for a string identifier
-(Class)viewClassForPatternItemType:(NSString*)patternItemType;

//override this method in subclasses to return an array of MDPatternLayoutItem's that determines the types/layout of pattern shapes
-(NSArray<MDPatternLayoutItem*>*)layoutItems;

//the whole pattern size
@property(nonatomic,assign)CGSize patternSize;
@end
