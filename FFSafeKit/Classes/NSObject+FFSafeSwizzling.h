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
 If new-method is added to a class, exchange the implementations of `originalSel` for `newSel`.
 
 @param cls The class you want to inspect.
 @param originalSel The selector of the original-method.
 @param newSel The selector of the new-method.
 */
+ (void)ff_exchangeInstanceMethodOfClass:(Class)cls
                        originalSelector:(SEL)originalSel
                             newSelector:(SEL)newSel;

@end

NS_ASSUME_NONNULL_END
