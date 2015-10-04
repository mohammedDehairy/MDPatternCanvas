//
//  MDPatternLayoutItem.h
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MDPatternLayoutItem : NSObject

-(instancetype)initWithTileType:(NSString*)type frame:(CGRect)frame;

@property(nonatomic,readonly)NSString *patternTileType;
@property(nonatomic,readonly)CGRect   frame;
@end
