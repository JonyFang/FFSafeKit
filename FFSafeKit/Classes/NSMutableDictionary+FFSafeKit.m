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
        //Exchange `removeObjectForKey:`
        NSString *removeObjectForKeyStr = @"removeObjectForKey:";
        NSString *safeRemoveObjectForKeyStr = @"safeMutable_removeObjectForKey:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSDictionaryM")
                                  originalSelector:NSSelectorFromString(removeObjectForKeyStr)
                                       newSelector:NSSelectorFromString(safeRemoveObjectForKeyStr)];
        
        //Exchange `setObject:forKey:`
        NSString *setObjectForKeyStr = @"setObject:forKey:";
        NSString *safeSetObjectForKeyStr = @"safeMutable_setObject:forKey:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSDictionaryM")
                                  originalSelector:NSSelectorFromString(setObjectForKeyStr)
                                       newSelector:NSSelectorFromString(safeSetObjectForKeyStr)];
    });
    
}

#pragma mark - Implement Methods
/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)safeMutable_removeObjectForKey:(id<NSCopying>)key {
    if (!key) {
        return;
    }
    [self safeMutable_removeObjectForKey:key];
}

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param object The value for aKey. A strong reference to the object is maintained by the dictionary.
 @param key The key for value. The key is copied (using `copyWithZone:`; keys must conform to the NSCopying protocol). If aKey already exists in the dictionary, anObject takes its place.
 */
- (void)safeMutable_setObject:(id)object forKey:(id<NSCopying>)key {
    if (!object) {
        return;
    }
    if (!key) {
        return;
    }
    return [self safeMutable_setObject:object forKey:key];
}

@end
