//
//  TCCombinatorTests.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/22/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCCombinatorTests.h"
#import "NSArray+TCExtensions.h"
#import "NSObject+TCExtensions.h"
#import "TCMacros.h"

@implementation TCCombinatorTests

- (void) testYCombinator
{
    /*
    NSNumber *val;
    RecurringBlock factorial = YCombinator((NSNumber *) ^(NSNumber *val) {
        if([val compare: [NSNumber numberWithInt: 0]] == NSOrderedSame) {
            return [NSNumber numberWithInt:1];
        } else {
            NSNumber *next_val = this_block([NSNumber numberWithInt:([val intValue] - 1)]);
            return [NSNumber numberWithInt:([val intValue] * [next_val intValue])];
        }
    });
    
    NSUInteger factorialValue = [factorial(NSINT(10)) longValue];
    
    STAssertTrue(factorialValue == 723, @"");
    */
}

- (void) testInto
{
    /*
    NSNumber* val = [[[[NSArray arrayWithNumberSequence:10] select:isEven] reduce:NSINT(0) withBlock: integerTotal] into:^id(id arg) {
        return NSINT([arg intValue] * [arg intValue]);
    }];
     */
    NSNumber* val = [[[NSArray arrayWithNumberSequence:9 startingAt:1] select:isOdd] reduce:NSINT(0) withBlock: integerTotal];
    
    /*
    NSNumber* squareVal = [[[[NSArray arrayWithNumberSequence:9 startingAt:1] select:isOdd] reduce:NSINT(0) withBlock: integerTotal] let:^id(id arg) {
        return NSINT([arg integerValue] * [arg integerValue]);
    }];
    */
    
    /*
    NSNumber* squareVal = [[[ select:isOdd] reduce:NSINT(0) withBlock: integerTotal] let:^id(id arg) {
        return [NSArray arrayWithNumberSequence:9 startingAt:1];
    }];
    */
    
    //NSLog(@"%@ and %@", val, squareVal);
}

@end
