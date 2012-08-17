//
//  TCCommonPredicates.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCCommonPredicates.h"

select_block_predicate isEven = ^ BOOL(id obj) {
    return [obj integerValue] % 2 == 0;
};

select_block_predicate isOdd = ^ BOOL(id obj) {
    return [obj integerValue] % 2 == 1;
};

reduce_block_predicate integerTotal = ^ id(id accumulator, id obj) {
    return [NSNumber numberWithInteger: [accumulator integerValue] + [obj integerValue]];
};

reduce_block_predicate floatTotal = ^ id(id accumulator, id obj) {
    return [NSNumber numberWithFloat: [accumulator floatValue] + [obj floatValue]];
};

reduce_block_predicate integerFactorial = ^ id(id accumulator, id obj) {
    return [NSNumber numberWithInteger: [accumulator integerValue] * [obj integerValue]];
};