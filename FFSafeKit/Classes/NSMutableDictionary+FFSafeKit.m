//
//  NSMutableDictionary+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSMutableDictionary+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (FFSafeKit)

#pragma mark - Load Method
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(setObject:forKey:) newSelector:@selector(ff_setObject:forKey:)];
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(setObject:forKeyedSubscript:) newSelector:@selector(ff_setObject:forKeyedSubscript:)];
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(removeObjectForKey:) newSelector:@selector(ff_removeObjectForKey:)];
        
        Class cfCls = NSClassFromString(@"__NSCFDictionary");
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(setObject:forKey:) newSelector:@selector(ff_setCFDictionary:forKey:)];
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(removeObjectForKey:) newSelector:@selector(ff_removeCFDictionaryForKey:)];
    });
    
}

#pragma mark - Implement Methods
/**
 Adds a given key-value pair to the dictionary.
 It's similar to `setObject:forKey:`, but it never throw exception.
 
 @param object The value for aKey.
 @param key The key for value.
 */
- (void)ff_setObject:(id)object forKey:(id<NSCopying>)key {
    if (!object || !key) {
        return;
    }
    return [self ff_setObject:object forKey:key];
}

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `setObject:forKeyedSubscript:`, but it never throw exception.
 
 @param object The value for key.
 @param key The key for value.
 */
- (void)ff_setObject:(id)object forKeyedSubscript:(id<NSCopying>)key {
    if (!object || !key) {
        return;
    }
    return [self ff_setObject:object forKeyedSubscript:key];
}

/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)ff_removeObjectForKey:(id)key {
    if (!key) {
        return;
    }
    [self ff_removeObjectForKey:key];
}

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `setObject:forKey:`, but it never throw exception.
 
 @param dict The value for key.
 @param key The key for value.
 */
- (void)ff_setCFDictionary:(id)dict forKey:(id<NSCopying>)key {
    if (!dict || !key) {
        return;
    }
    return [self ff_setCFDictionary:dict forKey:key];
}

/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)ff_removeCFDictionaryForKey:(id)key {
    if (!key) {
        return;
    }
    [self ff_removeCFDictionaryForKey:key];
}


@end
