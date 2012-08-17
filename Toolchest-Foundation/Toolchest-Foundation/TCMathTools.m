//
//  TCMathTools.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import "TCMathTools.h"

@implementation TCMathTools

+(NSUInteger) randomBelow:(NSUInteger) ceil
{
    NSUInteger normalizer = 1;
    NSUInteger randomVal;
    
    do {
        normalizer <<= 1;
    } while(normalizer < ceil);
    
    do {
        randomVal = arc4random() % normalizer;
    } while(randomVal >= ceil);
    
    return randomVal;
}

@end
