//
//  TCCommonPredicates.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^each_block_predicate)(id obj);
typedef void (^each_with_index_block_predicate)(id obj, NSUInteger index);
typedef BOOL (^select_block_predicate)(id obj);
typedef id   (^map_block_predicate)(id obj);
typedef id   (^reduce_block_predicate)(id accumulator, id obj);

//  Each predicates

//  Select predicates
select_block_predicate isEven;
select_block_predicate isOdd;

//  Map predicates

//  Reduce predicates
reduce_block_predicate integerTotal;
reduce_block_predicate floatTotal;
reduce_block_predicate integerFactorial;