//
//  TCTuple.m
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/21/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

// Inspired by https://github.com/mruegenberg/objc-utils/blob/master/CoreFoundationAdditions/FPTuple.h

#import "TCTuple.h"

@implementation TCTuple

@synthesize first, second;

- (id) initWith: (id) theFirst and: (id) theSecond
{
    if(self = [super init]) {
        self.first = theFirst;
        self.second = theSecond;
    }
    
    return self;
}

+ (id) tupleWith: (id) theFirst and: (id) theSecond
{
    return [[TCTuple alloc] initWith:theFirst and:theSecond];
}

@end
