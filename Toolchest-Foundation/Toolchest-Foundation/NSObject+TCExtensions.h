//
//  NSObject+TCExtensions.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/22/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TCExtensions)

-(id) tap: (void (^)()) block;
-(id) dont: (void (^)()) block;
-(id) into: (id (^)(id arg)) block;
-(id) let: (id (^)(id arg)) block;

@end
