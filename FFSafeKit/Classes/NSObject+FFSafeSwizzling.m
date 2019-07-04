//
//  NSObject+FFSafeSwizzling.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (FFSafeSwizzling)

+ (void)ff_exchangeInstanceMethodWithSelfClass:(Class)selfClass
                              originalSelector:(SEL)originalSelector
                              swizzledSelector:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(selfClass, originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(selfClass, swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
