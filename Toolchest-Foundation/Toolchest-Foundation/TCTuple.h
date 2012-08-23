//
//  TCTuple.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/21/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCTuple : NSObject

@property (nonatomic, strong) id    first;
@property (nonatomic, strong) id    second;

- (id) initWith: (id) theFirst and: (id) theSecond;
+ (id) tupleWith: (id) theFirst and: (id) theSecond;

@end
