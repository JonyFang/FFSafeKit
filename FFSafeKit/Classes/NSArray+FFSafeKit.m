//
//  NSArray+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSArray+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSArray (FFSafeKit)

#pragma mark - Load Method
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Exchange `objectAtIndex`
        NSString *objectAtIndexStr = @"objectAtIndex:";
        NSString *safeZeroObjectAtIndexStr = @"safe_zeroObjectAtIndex:";
        NSString *safeObjectAtIndexStr = @"safe_objectAtIndex:";
        NSString *safeSingleObjectAtIndexStr = @"safe_singleObjectAtIndex:";
        
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSArray0")
                                  originalSelector:NSSelectorFromString(objectAtIndexStr)
                                       newSelector:NSSelectorFromString(safeZeroObjectAtIndexStr)];
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSSingleObjectArrayI")
                                  originalSelector:NSSelectorFromString(objectAtIndexStr)
                                       newSelector:NSSelectorFromString(safeSingleObjectAtIndexStr)];
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSArrayI")
                                  originalSelector:NSSelectorFromString(objectAtIndexStr)
                                       newSelector:NSSelectorFromString(safeObjectAtIndexStr)];
        
        //Exchange `objectAtIndexedSubscript:`
        NSString *objectAtIndexedSubcriptStr = @"objectAtIndexedSubscript:";
        NSString *safeObjectAtIndexedSubscriptStr = @"safe_objectAtIndexedSubscript:";
        
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSArrayI")
                                        originalSelector:NSSelectorFromString(objectAtIndexedSubcriptStr)
                                        newSelector:NSSelectorFromString(safeObjectAtIndexedSubscriptStr)];
    });
    
}

#pragma mark - Implement Methods
/**
 Returns the object(from `__NSArrayI`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

/**
 Returns the object(from `__NSSingleObjectArrayI`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 Returns the object(from `__NSArray0`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_zeroObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_zeroObjectAtIndex:index];
}

/**
 Returns the object(from `__NSArrayI`) at the specified index, or return nil when out of bounds.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

@end
