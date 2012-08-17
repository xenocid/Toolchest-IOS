//
//  NSArray+TCExtensions.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TCExtensions)

-(void)         each:(void (^)(id obj))block;
-(NSArray*)     select:(BOOL (^)(id obj))block;
-(NSArray*)     map:(id (^)(id obj))block;
-(id)           reduce:(id) initial withBlock:(id (^)(id accumulator, id obj))block;

-(NSArray*)     arrayOfSortedStrings;
-(NSString*)    stringValue;

-(NSArray*)     unique;
-(NSArray*)     unionWithArray:(NSArray*) array;
-(NSArray*)     intersectionWithArray:(NSArray*) array;
-(NSArray*)     intersectionWithSet:(NSSet*) set;
-(NSArray*)     complementWithArray:(NSArray*) array;
-(NSArray*)     complementWithSet:(NSSet*) set;

+(NSArray*)     arrayWithNumberSequence:(NSUInteger) count;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom withStep:(NSInteger) step;

@end
