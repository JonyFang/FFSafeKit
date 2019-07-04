//
//  NSDictionary+FFSafeImp.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSObject+FFSafeImp.h"
#import <objc/runtime.h>

@implementation NSObject (FFSafeImp)

/**
 Exchanges the implementations of two methods.
 
 @param systemMethodString System method name.
 @param systemClassString System class name.
 @param safeMethodString Safe-custom method name.
 @param targetClassString Target class name.
 */
+ (void)ff_swizzlingMethod:(NSString *)systemMethodString
         systemClassString:(NSString *)systemClassString
        toSafeMethodString:(NSString *)safeMethodString
         targetClassString:(NSString *)targetClassString {
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemMethodString));
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(safeMethodString));
    method_exchangeImplementations(safeMethod, sysMethod);
}

@end
