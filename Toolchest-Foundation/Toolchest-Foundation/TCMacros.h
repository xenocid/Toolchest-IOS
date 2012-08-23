//
//  TCMacros.h
//  Toolchest-Foundation
//
//  Created by Alex Koloskov on 8/22/12.
//  Copyright (c) 2012 Alex Koloskov. All rights reserved.
//

#ifndef Toolchest_Foundation_TCMacros_h
#define Toolchest_Foundation_TCMacros_h

#ifndef NSINT
#define NSINT(x)    [NSNumber numberWithInteger: (x)]
#endif

#ifndef NSFLOAT
#define NSFLOAT(x)  [NSNumber numberWithFloat: (x)]
#endif

#ifndef NSARRAY
#define NSARRAY(args...) [NSArray arrayWithObjects:args, nil]
#endif

#ifndef EMPTY_ARRAY
#define EMPTY_ARRAY [NSArray array]
#endif

#ifndef NSDICT
#define NSDICT(args...) [NSDictionary dictionaryWithObjectsAndKeys:args, nil]
#endif

#ifndef EMPTY_DICT
#define EMPTY_DICT [NSDictionary dictionary]
#endif

/**
 *  This is based on the source from https://github.com/jballanc/objc-ycomb, who seems to be one of the few people playing with combinators in Obj-C
 */
typedef id (^RecurringBlock)(id);
#define YCombinator(function_block) (RecurringBlock) ^(RecurringBlock f) {\
                                        return (RecurringBlock) ^(RecurringBlock x) {\
                                            return Block_copy(^(id args) {\
                                                ((RecurringBlock)f((id)x((id)x)))(args);\
                                            });\
                                        }((RecurringBlock) ^(RecurringBlock x) {\
                                            return Block_copy(^(id args) {\
                                                ((RecurringBlock)f((id)x((id)x)))(args);\
                                            });\
                                        });\
                                    }((RecurringBlock) ^(RecurringBlock this_block) {\
                                        return Block_copy(function_block);\
                                    });\



#endif
