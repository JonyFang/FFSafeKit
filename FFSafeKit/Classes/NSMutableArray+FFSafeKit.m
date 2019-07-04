//
//  NSMutableArray+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSMutableArray+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (FFSafeKit)

#pragma mark - Load Method
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Exchange `objectAtIndex:`
        NSString *objectAtIndexStr = @"objectAtIndex:";
        NSString *safeObjectAtIndexStr = @"safeMutable_objectAtIndex:";
        [NSObject ff_exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                        originalSelector:NSSelectorFromString(objectAtIndexStr)
                                        swizzledSelector:NSSelectorFromString(safeObjectAtIndexStr)];
        
        //Exchange `removeObjectsInRange:`
        NSString *removeObjectsInRangeStr = @"removeObjectsInRange:";
        NSString *safeRemoveObjectsInRangeStr = @"safeMutable_removeObjectsInRange:";
        [NSObject ff_exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                        originalSelector:NSSelectorFromString(removeObjectsInRangeStr)
                                        swizzledSelector:NSSelectorFromString(safeRemoveObjectsInRangeStr)];
        
        //Exchange `insertObject:atIndex:`
        NSString *insetAtIndexStr = @"insertObject:atIndex:";
        NSString *safeInsetAtIndexStr = @"safeMutable_insertObject:atIndex:";
        [NSObject ff_exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                        originalSelector:NSSelectorFromString(insetAtIndexStr)
                                        swizzledSelector:NSSelectorFromString(safeInsetAtIndexStr)];
        
        //Exchange `removeObject:inRange:`
        NSString *removeInRangeStr = @"removeObject:inRange:";
        NSString *safeRemoveInRangeStr = @"safeMutable_removeObject:inRange:";
        [NSObject ff_exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                        originalSelector:NSSelectorFromString(removeInRangeStr)
                                        swizzledSelector:NSSelectorFromString(safeRemoveInRangeStr)];
        
        //Exchange `objectAtIndexedSubscript:`
        NSString *objectAtIndexedSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *safeObjectAtIndexedSubscriptStr = @"safeMutable_objectAtIndexedSubscript:";
        [NSObject ff_exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                        originalSelector:NSSelectorFromString(objectAtIndexedSubscriptStr)
                                        swizzledSelector:NSSelectorFromString(safeObjectAtIndexedSubscriptStr)];
    });
    
}

#pragma mark - Implement Methods
/**
 Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safeMutable_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safeMutable_objectAtIndex:index];
}

/**
 Removes from the array each of the objects within a given range, or return when out of bounds.
 It's similar to `removeObjectsInRange:`, but it never throw exception.
 
 @param range The range of the objects to be removed from the array.
 */
- (void)safeMutable_removeObjectsInRange:(NSRange)range {
    if (range.location > self.count) {
        return;
    }
    if (range.length > self.count) {
        return;
    }
    if ((range.location + range.length) > self.count) {
        return;
    }
    
    return [self safeMutable_removeObjectsInRange:range];
}

/**
 Removes all occurrences within a specified range in the array of a given object, or return when `object` is nil or `index` is greater than the count of elements in the array.
 
 @param object The object to be removed from the array’s content.
 @param range The range from which to remove anObject.
 */
- (void)safeMutable_removeObject:(id)object inRange:(NSRange)range {
    if (range.location > self.count) {
        return;
    }
    if (range.length > self.count) {
        return;
    }
    if ((range.location + range.length) > self.count) {
        return;
    }
    if (!object) {
        return;
    }
    
    return [self safeMutable_removeObject:object inRange:range];
}

/**
 Inserts a given object into the array’s contents at a given index, or return when `object` is nil or `index` is greater than the count of elements in the array.
 
 @param object The object to add to the array's content.
 @param index The index in the array at which to insert anObject.
 */
- (void)safeMutable_insertObject:(id)object atIndex:(NSUInteger)index {
    if (index > self.count) {
        return;
    }
    if (!object) {
        return;
    }
    
    [self safeMutable_insertObject:object atIndex:index];
}

/**
 Returns the object at the specified index, or return nil when out of bounds.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)safeMutable_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safeMutable_objectAtIndexedSubscript:index];
}

@end
