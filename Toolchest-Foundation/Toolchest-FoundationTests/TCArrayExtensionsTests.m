//
//  TCArrayExtensionsTests.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/16/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCArrayExtensionsTests.h"

#import "TCMacros.h"
#import "NSArray+TCExtensions.h"
#import "NSMutableArray+TCExtensions.h"

@implementation TCArrayExtensionsTests

-(void) testArrayOfSortedString
{
    NSArray* array = [ NSARRAY( @"charlie", @"zulu", @"alpha", NSINT(2), @"bravo") arrayOfSortedStrings];
    NSArray* controlArray = NSARRAY( @"alpha", @"bravo", @"charlie", @"zulu");
    
    [controlArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STAssertTrue( [((NSString*)obj) isEqualToString: (NSString*)[array objectAtIndex:idx]], @"Strings do not match");
    }];
}

-(void) testStringValue
{
    NSString* stringValue = [ NSARRAY( @"charlie", @"zulu", @"alpha") stringValue];
    STAssertTrue([stringValue isEqualToString:@"charlie zulu alpha"], @"Strings do not match");
}

-(void) testSelect
{
    NSArray* digits1 = [[NSArray arrayWithNumberSequence:100] select:^BOOL(id value) {
        return 0 == ([value integerValue] % 2);
    }];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 50; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger: 2*i]];
    }
    
    for(int i = 0; i < 50; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testEach
{
    NSMutableArray* digits1 = [NSMutableArray array];
    [[NSArray arrayWithNumberSequence:10] each:^(id value) {
        [digits1 addObject: [NSNumber numberWithInteger: [value integerValue] * 3]];
    }];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 10; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger: i * 3]];
    }
    
    for(int i = 0; i < 10; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testMap
{
    NSArray* digits1 = [[NSArray arrayWithNumberSequence:10] map:^id(id value) {
        return [NSNumber numberWithInteger: [value integerValue] * 2];
    }];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 10; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger: i * 2]];
    }
    
    for(int i = 0; i < 10; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testReduce
{
    NSNumber* result = [[NSArray arrayWithNumberSequence:10 startingAt: 1] reduce:[NSNumber numberWithInteger:2] withBlock:^id(id result, id value) {
        return [NSNumber numberWithInteger: [result integerValue] * [value integerValue]];
    }];
    
    NSNumber* controlResult = [NSNumber numberWithInteger:2];
    for(int i = 1; i <= 10; i++) {
        controlResult = [NSNumber numberWithInteger: [controlResult integerValue] * i];
    }
    
    STAssertEquals([result integerValue], [controlResult integerValue], @"Arrays do not match");
}

-(void) testZip
{
    NSArray* digits = [NSArray arrayWithNumberSequence:3];
    NSArray* letters = NSARRAY( @"a", @"b", @"c", @"d");
    
    NSArray* zipped = [letters zip: digits];
    
    STAssertTrue([[zipped objectAtIndex:2] objectAtIndex:0] == @"c", @"[NSArray zip] failed");
    STAssertTrue([[zipped objectAtIndex:3] objectAtIndex:1] == [NSNull null], @"[NSArray zip] failed");
}

-(void) testSlice
{
    NSArray* digits = [NSArray arrayWithNumberSequence:10];
    
    NSArray* middle4 = [digits slice:4 to:7];
    
    STAssertTrue(middle4.count == 4, @"[NSArray slice] failed");
    STAssertTrue([[NSArray arrayWithNumberSequence:4 startingAt:4] isEqualToArray:middle4], @"[NSArray slice] failed");
}

-(void) testMoveObjectAtIndex
{
    NSMutableArray* digits = [[NSArray arrayWithNumberSequence:3] mutableCopy];
    NSArray* controlDigits = NSARRAY(NSINT(0), NSINT(2), NSINT(1));
    
    [digits moveObjectAtIndex:2 toIndex:1];
    
    for(int i = 0; i < 3; i++) {
        STAssertEquals([[digits objectAtIndex:i] integerValue], [[controlDigits objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testUnique
{
    NSArray* initial = NSARRAY( @"alpha", @"alpha", @"bravo", @"bravo", @"bravo", @"charlie");
    NSArray* control = NSARRAY( @"alpha", @"bravo", @"charlie");
    
    NSArray* uniques = [initial unique];
    
    STAssertTrue([control isEqualToArray:uniques], @"testUnique: arrays do not match");
}

-(void) testUnion
{
    NSArray* array1 = NSARRAY( @"alpha", @"bravo", @"charlie", @"delta");
    NSArray* array2 = NSARRAY( @"alpha", @"echo", @"foxtrot");
    NSArray* control = NSARRAY( @"alpha", @"bravo", @"charlie", @"delta", @"echo", @"foxtrot");
    
    NSArray* unionArray = [array1 unionWithArray: array2];
    
    unionArray = [unionArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    [[control sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STAssertTrue( [(NSString*)obj isEqualToString: [unionArray objectAtIndex:idx]], @"Strings are not equal");
    }];
}

-(void) testIntersection
{
    NSArray* array1 = NSARRAY( @"alpha", @"bravo", @"charlie", @"delta");
    NSArray* array2 = NSARRAY( @"alpha", @"echo", @"foxtrot");
    NSArray* control = NSARRAY( @"alpha");
    
    NSArray* intersectionArray = [array1 intersectionWithArray: array2];
    
    intersectionArray = [intersectionArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    [[control sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STAssertTrue( [(NSString*)obj isEqualToString: [intersectionArray objectAtIndex:idx]], @"Strings are not equal");
    }];
}

-(void) testComplementation
{
    NSArray* array1 = NSARRAY( @"alpha", @"bravo", @"charlie", @"delta");
    NSArray* array2 = NSARRAY( @"alpha", @"echo", @"foxtrot");
    NSArray* control = NSARRAY( @"bravo", @"charlie", @"delta");
    
    NSArray* complementationArray = [array1 complementWithArray: array2];
    
    complementationArray = [complementationArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    [[control sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STAssertTrue( [(NSString*)obj isEqualToString: [complementationArray objectAtIndex:idx]], @"Strings are not equal");
    }];
}

-(void) testArrayWithNumberSequence
{
    NSArray* digits1 = [NSArray arrayWithNumberSequence:5];
    NSMutableArray* controlDigits1 = [NSMutableArray array];
    for(int i = 0; i < 5; i++) {
        [controlDigits1 addObject: [NSNumber numberWithInteger:i]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits1 objectAtIndex:i] integerValue], [[controlDigits1 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
    
    NSArray* digits2 = [NSArray arrayWithNumberSequence:5 startingAt:-2];
    NSMutableArray* controlDigits2 = [NSMutableArray array];
    for(int i = -2; i < 3; i++) {
        [controlDigits2 addObject: [NSNumber numberWithInteger:i]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits2 objectAtIndex:i] integerValue], [[controlDigits2 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
    
    NSArray* digits3 = [NSArray arrayWithNumberSequence:5 startingAt:50 withStep:25];
    NSMutableArray* controlDigits3 = [NSMutableArray array];
    for(int i = 0; i < 5; i++) {
        [controlDigits3 addObject: [NSNumber numberWithInteger:50 + i * 25]];
    }
    
    for(int i = 0; i < 5; i++) {
        STAssertEquals([[digits3 objectAtIndex:i] integerValue], [[controlDigits3 objectAtIndex:i] integerValue], @"Arrays do not match");
    }
}

-(void) testTotalPredicates
{
    NSArray* digits = [NSArray arrayWithNumberSequence:10];
    NSNumber* sum = [digits reduce:[NSNumber numberWithInteger:0] withBlock: integerTotal];
    
    STAssertEquals([sum integerValue], 45, @"");
}

-(void) testFirstObject
{
    NSArray* digits = [NSArray arrayWithNumberSequence:10 startingAt:7];
    STAssertTrue([[digits firstObject] isEqualToNumber: [NSNumber numberWithInteger:7]], @"[NSArray firstObject] failed");
}

-(void) testCycle
{
    NSArray* letters = NSARRAY( @"a", @"b", @"c");
    NSMutableString* result = [@"" mutableCopy];
    
    [letters cycle:3 with:^(id obj) {
        [result appendString: (NSString*)obj];
    }];
    
    STAssertTrue([@"abcabcabc" isEqualToString:result], @"[NSArray cycle] failed");
}

@end
