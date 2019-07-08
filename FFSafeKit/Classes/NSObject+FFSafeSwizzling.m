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

+ (void)ff_exchangeInstanceMethodOfClass:(Class)cls
                        originalSelector:(SEL)originalSel
                             newSelector:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    
    //YES if the method was added successfully, otherwise NO.
    BOOL isAdded = class_addMethod(cls, originalSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAdded) {
        class_replaceMethod(cls, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end
