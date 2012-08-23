//
//  NSObject+TCExtensions.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/22/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "NSObject+TCExtensions.h"

@implementation NSObject (TCExtensions)

/**
 * This is a Kestrel (K-combinator) that works identically to Ruby's tap method
 * Useful for adding logging or no-ops
 */
-(id) tap: (void (^)()) block
{
    block();
    return self;
}

/**
 *  Same kestrel as tap, but now ignoring the block completely. You can switch tap and dont to turn your block execution on and off.
 */
-(id) dont: (void (^)()) block
{
    return self;
}

-(id) into: (id (^)(id arg)) block
{
    return self;
}

-(id) let: (id (^)(id arg)) block
{
    return block(self);
}

@end
