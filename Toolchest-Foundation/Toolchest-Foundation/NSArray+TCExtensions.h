//
//  NSArray+TCExtensions.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TCExtensions)

-(void)         each:(void (^)(id))block;
-(NSArray*)     select:(BOOL (^)(id))block;
-(NSArray*)     map:(id (^)(id))block;
-(id)           reduce:(id) initial withBlock:(id (^)(id, id))block;

- (NSArray*)    arrayOfSortedStrings;
- (NSString*)   stringValue;

+(NSArray*)     arrayWithNumberSequence:(NSUInteger) count;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom;
+(NSArray*)     arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom withStep:(NSInteger) step;

@end
