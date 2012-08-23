//
//  NSArray+TCExtensions.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCCommonPredicates.h"

@interface NSArray (TCExtensions)

-(void)         each:(each_block_predicate)block;
-(void)         eachWithIndex:(each_with_index_block_predicate)block;
-(NSArray*)     select:(select_block_predicate)block;
-(NSArray*)     map:(map_block_predicate)block;
-(id)           reduce:(id) initial withBlock:(reduce_block_predicate)block;
-(NSArray*)     zip: (NSArray*) otherArray;
-(NSArray*)     slice: (NSUInteger) from to: (NSUInteger) to;
-(void)         cycle: (NSUInteger) times with: (each_block_predicate) block;

-(NSArray*)     arrayOfSortedStrings;
-(NSString*)    stringValue;

-(NSArray*)     unique;
-(NSArray*)     unionWithArray:(NSArray*) array;
-(NSArray*)     intersectionWithArray:(NSArray*) array;
-(NSArray*)     intersectionWithSet:(NSSet*) set;
-(NSArray*)     complementWithArray:(NSArray*) array;
-(NSArray*)     complementWithSet:(NSSet*) set;

-(id)           firstObject;

+(NSArray*)     arrayWithNumberSequence:(NSUInteger) count;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom withStep:(NSInteger) step;

@end
