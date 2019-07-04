//
//  NSObject+FFSafeSwizzling.h
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FFSafeSwizzling)

/**
 Replaces the implementation of a method for a given class, or exchanges the implementations of two methods.
 
 @param selfClass The class you want to inspect.
 @param originalSelector The selector of the method you want to retrieve.
 @param swizzledSelector The swizzled selector of the method you want to retrieve.
 */
+ (void)ff_exchangeInstanceMethodWithSelfClass:(Class)selfClass
                              originalSelector:(SEL)originalSelector
                              swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
