//
//  NSMutableArray+TCExtensions.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "NSMutableArray+TCExtensions.h"

#import "TCMathTools.h"

@implementation NSMutableArray (TCExtensions)

- (void) moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    id result = [self objectAtIndex:fromIndex];
    [self insertObject:result atIndex:toIndex];
}

- (void) shuffle
{
    // http://en.wikipedia.org/wiki/Knuth_shuffle
    
    for(NSUInteger i = [self count]; i > 1; i--) {
        NSUInteger j = [TCMathTools randomBelow:i];
        [self exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
}

@end
