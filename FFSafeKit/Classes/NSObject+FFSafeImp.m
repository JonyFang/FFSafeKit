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

+ (void)ff_swizzlingMethod:(NSString *)systemMethodString
         systemClassString:(NSString *)systemClassString
        toSafeMethodString:(NSString *)safeMethodString
         targetClassString:(NSString *)targetClassString {
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemMethodString));
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(safeMethodString));
    method_exchangeImplementations(safeMethod, sysMethod);
}

@end
