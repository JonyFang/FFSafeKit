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

+ (void)ff_exchangeInstanceMethodWithSelfClass:(Class)selfClass
                              originalSelector:(SEL)originalSelector
                              swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
