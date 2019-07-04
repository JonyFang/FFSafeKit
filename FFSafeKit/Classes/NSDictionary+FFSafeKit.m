//
//  NSDictionary+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSDictionary+FFSafeKit.h"
#import "NSObject+FFSafeImp.h"
#import <objc/runtime.h>

@implementation NSDictionary (FFSafeKit)

#pragma mark - Load Method
+ (void)load{
    NSString *systemMethod = @"initWithObjects:forKeys:count:";
    NSString *systemClassStr = @"__NSPlaceholderDictionary";
    NSString *safeMethodStr = @"initWithObjects_safe:forKeys:count:";
    NSString *targetClassStr = @"NSDictionary";
    
    [self ff_swizzlingMethod:systemMethod systemClassString:systemClassStr toSafeMethodString:safeMethodStr targetClassString:targetClassStr];
}

#pragma mark - Implement Methods
/**
 Initializes a newly allocated dictionary with the specified number of key-value pairs constructed from the provided C arrays of keys and objects.
 It's similar to `initWithObjects:forKeys:count:`, but it never throw exception.
 
 @param objects A C array of values for the new dictionary.
 @param keys A C array of keys for the new dictionary. Each key is copied (using copyWithZone:; keys must conform to the NSCopying protocol), and the copy is added to the new dictionary.
 @param count The number of elements to use from the keys and objects arrays. count must not exceed the number of elements in objects or keys.
 */
- (instancetype)initWithObjects_safe:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        } else {
            rightCount++;
        }
    }
    self = [self initWithObjects_safe:objects forKeys:keys count:rightCount];
    
    return self;
}

@end
