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
-(void)registerClass:(Class)viewClass forPatternItemType:(NSString*)patternItemType;
-(Class)viewClassForPatternItemType:(NSString*)patternItemType;

-(NSArray<MDPatternLayoutItem*>*)layoutItems;

@property(nonatomic,assign)CGSize patternSize;
@end
