//
//  NSDictionary+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSDictionary+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSDictionary (FFSafeKit)

#pragma mark - Load Method
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSPlaceholderDictionary") originalSelector:@selector(initWithObjects:forKeys:count:) newSelector:@selector(ff_initWithObjects:forKeys:count:)];
        [self ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSPlaceholderDictionary") originalSelector:@selector(initWithObjects:forKeys:) newSelector:@selector(ff_initWithObjects:forKeys:)];
    });
}

#pragma mark - Implement Methods
/**
 Initializes a newly allocated dictionary with key-value pairs constructed from the provided arrays of keys and objects.
 It's similar to `initWithObjects:forKeys:`, but it never throw exception.
 
 @param objects An array containing the values for the new dictionary.
 @param keys An array containing the keys for the new dictionary.
 */
- (instancetype)ff_initWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys {
    NSUInteger count = MIN(objects.count, keys.count);
    NSMutableArray *newKeys = [NSMutableArray array];
    NSMutableArray *newObjects = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < count; i++) {
        id key = keys[i];
        id object = objects[i];
        if (!key) {
            continue;
        }
        if (!object) {
            object = [NSNull null];
        }
        [newKeys addObject:key];
        [newObjects addObject:object];
    }
    
    return [self ff_initWithObjects:newObjects forKeys:newKeys];
}

/**
 Initializes a newly allocated dictionary with the specified number of key-value pairs constructed from the provided C arrays of keys and objects.
 It's similar to `initWithObjects:forKeys:count:`, but it never throw exception.
 
 @param objects A C array of values for the new dictionary.
 @param keys A C array of keys for the new dictionary. Each key is copied (using copyWithZone:; keys must conform to the NSCopying protocol), and the copy is added to the new dictionary.
 @param cnt The number of elements to use from the keys and objects arrays. count must not exceed the number of elements in objects or keys.
 */
- (instancetype)ff_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    id newKeys[cnt];
    id newObjects[cnt];
    NSUInteger index = 0;
    
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id object = objects[i];
        if (!key) {
            continue;
        }
        if (!object) {
            object = [NSNull null];
        }
        newKeys[index] = key;
        newObjects[index] = object;
        index++;
    }
    
    return [self ff_initWithObjects:newObjects forKeys:newKeys count:index];
}

@end
