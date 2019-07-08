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
        
        Class cls = NSClassFromString(@"__NSArrayM");
        
        //Exchange `objectAtIndexedSubscript:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(ff_mObjectAtIndexedSubscript:)];
        
        //Exchange `insertObject:atIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(insertObject:atIndex:) newSelector:@selector(ff_insertMObject:atIndex:)];
        
        //Exchange `removeObjectAtIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(removeObjectAtIndex:) newSelector:@selector(ff_removeMObjectAtIndex:)];
        
        //Exchange `removeObjectsInRange:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(removeObjectsInRange:) newSelector:@selector(ff_removeMObjectsInRange:)];
        
        //Exchange `replaceObjectAtIndex:withObject:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(replaceObjectAtIndex:withObject:) newSelector:@selector(ff_replaceMObjectAtIndex:withObject:)];
        
        //Exchange `replaceObjectsInRange:withObjectsFromArray:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(replaceObjectsInRange:withObjectsFromArray:) newSelector:@selector(ff_replaceMObjectsInRange:withObjectsFromArray:)];
        
        Class cfCls = NSClassFromString(@"__NSCFArray");
        
        //Exchange `objectAtIndexedSubscript:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(ff_cfmObjectAtIndexedSubscript:)];
        
        //Exchange `insertObject:atIndex:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(insertObject:atIndex:) newSelector:@selector(ff_insertCFMObject:atIndex:)];
        
        //Exchange `removeObjectAtIndex:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(removeObjectAtIndex:) newSelector:@selector(ff_removeCFMObjectAtIndex:)];
        
        //Exchange `removeObjectsInRange:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(removeObjectsInRange:) newSelector:@selector(ff_removeCFMObjectsInRange:)];
        
        //Exchange `replaceObjectAtIndex:withObject:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(replaceObjectAtIndex:withObject:) newSelector:@selector(ff_replaceCFMObjectAtIndex:withObject:)];
        
        //Exchange `replaceObjectsInRange:withObjectsFromArray:`
        [self ff_exchangeInstanceMethodOfClass:cfCls originalSelector:@selector(replaceObjectsInRange:withObjectsFromArray:) newSelector:@selector(ff_replaceCFMObjectsInRange:withObjectsFromArray:)];
    });
    
}

#pragma mark - `__NSArrayM`

/**
 Returns the object at the specified index.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_mObjectAtIndexedSubscript:(NSUInteger)index {
    id arr = nil;
    @try {
        arr = [self ff_mObjectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return arr;
    }
}

/**
 Inserts a given object into the array’s contents at a given index.
 It's similar to `insertObject:atIndex:`, but it never throw exception.
 
 @param object The object to add to the array's content.
 @param index The index in the array at which to insert `object`.
 */
- (void)ff_insertMObject:(id)object atIndex:(NSUInteger)index {
    @try {
        [self ff_insertMObject:object atIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Removes the object at index.
 It's similar to `removeObjectAtIndex:`, but it never throw exception.
 
 @param index The index from which to remove the object in the array.
 */
- (void)ff_removeMObjectAtIndex:(NSUInteger)index {
    @try {
        [self ff_removeMObjectAtIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Removes from the array each of the objects within a given range.
 It's similar to `removeObjectsInRange:`, but it never throw exception.
 
 @param range The range of the objects to be removed from the array.
 */
- (void)ff_removeMObjectsInRange:(NSRange)range {
    @try {
        [self ff_removeMObjectsInRange:range];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Replaces the object at index with anObject.
 It's similar to `replaceObjectAtIndex:withObject:`, but it never throw exception.
 
 @param index The index of the object to be replaced.
 */
- (void)ff_replaceMObjectAtIndex:(NSUInteger)index withObject:(id)object {
    @try {
        [self ff_replaceMObjectAtIndex:index withObject:object];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Replaces the objects in the receiving array specified by a given range with all of the objects from a given array.
 It's similar to `replaceObjectsInRange:withObjectsFromArray:`, but it never throw exception.
 
 @param range The range of objects to be replaced in (or removed from) the receiving array.
 @param otherArray The array of objects from which to select replacements for the objects in range.
 */
- (void)ff_replaceMObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray {
    @try {
        [self ff_replaceMObjectsInRange:range withObjectsFromArray:otherArray];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

#pragma mark - `__NSCFArray`

/**
 Returns the object at the specified index.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_cfmObjectAtIndexedSubscript:(NSUInteger)index {
    id arr = nil;
    @try {
        arr = [self ff_cfmObjectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return arr;
    }
}

/**
 Inserts a given object into the array’s contents at a given index.
 It's similar to `insertObject:atIndex:`, but it never throw exception.
 
 @param object The object to add to the array's content.
 @param index The index in the array at which to insert `object`.
 */
- (void)ff_insertCFMObject:(id)object atIndex:(NSUInteger)index {
    @try {
        [self ff_insertCFMObject:object atIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Removes the object at index.
 It's similar to `removeObjectAtIndex:`, but it never throw exception.
 
 @param index The index from which to remove the object in the array.
 */
- (void)ff_removeCFMObjectAtIndex:(NSUInteger)index {
    @try {
        [self ff_removeCFMObjectAtIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Removes from the array each of the objects within a given range.
 It's similar to `removeObjectsInRange:`, but it never throw exception.
 
 @param range The range of the objects to be removed from the array.
 */
- (void)ff_removeCFMObjectsInRange:(NSRange)range {
    @try {
        [self ff_removeCFMObjectsInRange:range];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Replaces the object at index with anObject.
 It's similar to `replaceObjectAtIndex:withObject:`, but it never throw exception.
 
 @param index The index of the object to be replaced.
 */
- (void)ff_replaceCFMObjectAtIndex:(NSUInteger)index withObject:(id)object {
    @try {
        [self ff_replaceCFMObjectAtIndex:index withObject:object];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

/**
 Replaces the objects in the receiving array specified by a given range with all of the objects from a given array.
 It's similar to `replaceObjectsInRange:withObjectsFromArray:`, but it never throw exception.
 
 @param range The range of objects to be replaced in (or removed from) the receiving array.
 @param otherArray The array of objects from which to select replacements for the objects in range.
 */
- (void)ff_replaceCFMObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray {
    @try {
        [self ff_replaceCFMObjectsInRange:range withObjectsFromArray:otherArray];
    } @catch (NSException *exception) {
        //
    } @finally {
    }
}

@end
