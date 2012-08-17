//
//  NSMutableArray+TCExtensions.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "NSMutableArray+TCExtensions.h"

@implementation NSMutableArray (TCExtensions)

- (void) moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    id result = [self objectAtIndex:fromIndex];
    [self insertObject:result atIndex:toIndex];
}

@end
