//
//  NSMutableArray+TCExtensions.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/17/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TCExtensions)

- (void)        moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)        shuffle;

@end
