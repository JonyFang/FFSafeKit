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
        Class clsS = NSClassFromString(@"__NSSingleObjectArrayI");
        Class clsP = NSClassFromString(@"__NSPlaceholderArray");
        Class clsI = NSClassFromString(@"__NSArrayI");
        Class cls0 = NSClassFromString(@"__NSArray0");
        
        //Exchange `initWithObjects:count:`
        [self ff_exchangeInstanceMethodOfClass:clsP originalSelector:@selector(initWithObjects:count:) newSelector:@selector(ff_initWithObjects:count:)];
        
        //Exchange `objectAtIndex:`
        [self ff_exchangeInstanceMethodOfClass:clsI originalSelector:@selector(objectAtIndex:) newSelector:@selector(ff_IObjectAtIndex:)];
        [self ff_exchangeInstanceMethodOfClass:cls0 originalSelector:@selector(objectAtIndex:) newSelector:@selector(ff_0ObjectAtIndex:)];
        [self ff_exchangeInstanceMethodOfClass:clsS originalSelector:@selector(objectAtIndex:) newSelector:@selector(ff_sObjectAtIndex:)];
        
        //Exchange `objectAtIndexedSubscript:`
        [self ff_exchangeInstanceMethodOfClass:clsI originalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(ff_IObjectAtIndexedSubscript:)];
    });
    
}

/**
 Initializes a newly allocated array to include a given number of objects from a given C array.
 It's similar to `initWithObjects:count:`, but it never throw exception.
 
 @param objects A C array of objects.
 @param cnt The number of values from the objects C array to include in the new array.
 */
- (instancetype)ff_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {
    id arr = nil;
    @try {
        arr = [self ff_initWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        NSUInteger index = 0;
        id newArr[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i]) {
                newArr[index] = objects[i];
                index++;
            }
        }
        arr = [self ff_initWithObjects:newArr count:index];
    } @finally {
        return arr;
    }
}

/**
 Returns the object located at the specified index.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_IObjectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ff_IObjectAtIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return object;
    }
}

/**
 Returns the object located at the specified index.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_0ObjectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ff_0ObjectAtIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return object;
    }
}

/**
 Returns the object located at the specified index.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_sObjectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ff_sObjectAtIndex:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return object;
    }
}

/**
 Returns the object at the specified index.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)ff_IObjectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self ff_IObjectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        //
    } @finally {
        return object;
    }
}

@end
