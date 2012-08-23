//
//  TCTupleTests.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/21/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCTupleTests.h"

#import "TCTuple.h"

@implementation TCTupleTests

- (void) testTuple
{
    NSNumber* number = [NSNumber numberWithInteger:723];
    NSString* string = @"Klaatu barada nikto";
    
    TCTuple* tuple = [TCTuple tupleWith:number and:string];
    
    STAssertTrue([tuple.second isEqualToString:string], @"Second element is wrong");
    STAssertTrue([tuple.first isEqualToNumber: [NSNumber numberWithInteger:723]], @"First element is wrong");
}

@end
