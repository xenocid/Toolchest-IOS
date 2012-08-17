//
//  NSArray+TCExtensions.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "NSArray+TCExtensions.h"

@implementation NSArray (TCExtensions)

+(NSArray*) arrayWithNumberSequence:(NSUInteger) count
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:count];
    
    for(NSInteger i = 0; i < count; i++) {
        [result addObject: [NSNumber numberWithInteger:i]];
    }
    
    return result;
}

+(NSArray*) arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:count];
    
    for(NSInteger i = startFrom; i < startFrom + count; i++) {
        [result addObject: [NSNumber numberWithInteger:i]];
    }
    
    return result;
}

+(NSArray*) arrayWithNumberSequence:(NSInteger) count startingAt:(NSInteger) startFrom withStep:(NSInteger) step
{
    NSMutableArray* result = [NSMutableArray arrayWithCapacity:count];
    NSInteger val = startFrom;
    
    for(NSInteger i = 0; i < count; i++) {
        [result addObject: [NSNumber numberWithInteger:val]];
        val += step;
    }
    
    return result;
}

-(void) each:(void (^)(id))block
{
    for (id obj in self) {
        block(obj);
    }
}

-(NSArray*) select:(BOOL (^)(id))block
{
    NSMutableArray* results = [NSMutableArray array];
    for (id obj in self) {
        if (block(obj)) {
            [results addObject:obj];
        }
    }
    return results;
}

-(NSArray*) map:(id (^)(id))block
{
    NSMutableArray* results = [NSMutableArray array];
    for (id obj in self) {
        [results addObject:block(obj)];
    }
    return results;
}

-(id) reduce:(id) initial withBlock:(id (^)(id, id))block
{
    id result = initial;
    for (id obj in self) {
        result = block(result, obj);
    }
    return result;
}

- (NSArray*) arrayOfSortedStrings
{
	return [[NSMutableArray arrayWithArray: [self select: ^BOOL(id value) {
        return [value isKindOfClass: [NSString class]];
    }]] sortedArrayUsingSelector: @selector(caseInsensitiveCompare:)];
}

- (NSString*) stringValue
{
	return [self componentsJoinedByString:@" "];
}


@end
