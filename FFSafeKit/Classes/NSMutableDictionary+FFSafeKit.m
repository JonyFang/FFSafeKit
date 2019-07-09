//
//  NSMutableDictionary+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSMutableDictionary+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import "FFSafeHelper.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (FFSafeKit)

#pragma mark - Load Method
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        
        //Exchange `setObject:forKey:`
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(setObject:forKey:) newSelector:@selector(ff_setObject:forKey:)];
        
        //Exchange `setObject:forKeyedSubscript:`
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(setObject:forKeyedSubscript:) newSelector:@selector(ff_setObject:forKeyedSubscript:)];
        
        //Exchange `removeObjectForKey:`
        [NSObject ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(removeObjectForKey:) newSelector:@selector(ff_removeObjectForKey:)];
        
        Class cfCls = NSClassFromString(@"__NSCFDictionary");
        
        //Exchange `setObject:forKey:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(setObject:forKey:) newSelector:@selector(ff_setCFDictionary:forKey:)];
        
        //Exchange `removeObjectForKey:`
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
    @try {
        [self ff_setObject:object forKey:key];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `setObject:forKeyedSubscript:`, but it never throw exception.
 
 @param object The value for key.
 @param key The key for value.
 */
- (void)ff_setObject:(id)object forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self ff_setObject:object forKeyedSubscript:key];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)ff_removeObjectForKey:(id)key {
    @try {
        [self ff_removeObjectForKey:key];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `setObject:forKey:`, but it never throw exception.
 
 @param dict The value for key.
 @param key The key for value.
 */
- (void)ff_setCFDictionary:(id)dict forKey:(id<NSCopying>)key {
    @try {
        [self ff_setCFDictionary:dict forKey:key];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)ff_removeCFDictionaryForKey:(id)key {
    @try {
        [self ff_removeCFDictionaryForKey:key];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}


@end
