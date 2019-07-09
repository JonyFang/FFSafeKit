//
//  NSMutableString+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/4.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSMutableString+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import "FFSafeHelper.h"
#import <objc/runtime.h>

@implementation NSMutableString (FFSafeKit)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class pCls = NSClassFromString(@"NSPlaceholderMutableString");
        
        //Exchange `[NSPlaceholderMutableString initWithString:]`
        [self ff_exchangeInstanceMethodOfClass:pCls originalSelector:@selector(initWithString:) newSelector:@selector(ff_initWithString:)];
        
        Class cls = NSClassFromString(@"__NSCFString");
        
        //Exchange `hasPrefix:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(hasPrefix:) newSelector:@selector(ff_hasPrefix:)];
        
        //Exchange `hasSuffix:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(hasSuffix:) newSelector:@selector(ff_hasSuffix:)];
        
        //Exchange `substringFromIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(substringFromIndex:) newSelector:@selector(ff_substringFromIndex:)];
        
        //Exchange `substringToIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(substringToIndex:) newSelector:@selector(ff_substringToIndex:)];
        
        //Exchange `substringWithRange:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(substringWithRange:) newSelector:@selector(ff_substringWithRange:)];
        
        //Exchange `characterAtIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(characterAtIndex:) newSelector:@selector(ff_characterAtIndex:)];
        
        //Exchange `stringByReplacingOccurrencesOfString:withString:options:range:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) newSelector:@selector(ff_stringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //Exchange `stringByReplacingOccurrencesOfString:withString:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(stringByReplacingOccurrencesOfString:withString:) newSelector:@selector(ff_stringByReplacingCharactersInRange:withString:)];
        
        //Exchange `stringByReplacingCharactersInRange:withString:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(stringByReplacingCharactersInRange:withString:) newSelector:@selector(ff_stringByReplacingCharactersInRange:withString:)];
        
        //Exchange `replaceCharactersInRange:withString:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(replaceCharactersInRange:withString:) newSelector:@selector(ff_replaceCharactersInRange:withString:)];
        
        //Exchange `replaceOccurrencesOfString:withString:options:range:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(replaceOccurrencesOfString:withString:options:range:) newSelector:@selector(ff_replaceOccurrencesOfString:withString:options:range:)];
        
        //Exchange `insertString:atIndex:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(insertString:atIndex:) newSelector:@selector(ff_insertString:atIndex:)];
        
        //Exchange `deleteCharactersInRange:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(deleteCharactersInRange:) newSelector:@selector(ff_deleteCharactersInRange:)];
        
        //Exchange `appendString:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(appendString:) newSelector:@selector(ff_appendString:)];
        
        //Exchange `setString:`
        [self ff_exchangeInstanceMethodOfClass:cls originalSelector:@selector(setString:) newSelector:@selector(ff_setString:)];
    });
}

#pragma mark - Implement Methods

/**
 Returns an NSMutableString object initialized by copying the characters from another given string.
 It's similar to `initWithString:`, but it never throw exception.
 
 @param string The string from which to copy characters.
 */
- (instancetype)ff_initWithString:(NSString *)string {
    id safeStr = nil;
    @try {
        safeStr = [self ff_initWithString:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return safeStr;
    }
}

/**
 Returns a Boolean value that indicates whether a given string matches the beginning characters of the receiver.
 It's similar to `hasPrefix:`, but it never throw exception.
 
 @param string A string.
 */
- (BOOL)ff_hasPrefix:(NSString *)string {
    BOOL hasPerfix = NO;
    @try {
        hasPerfix = [self ff_hasPrefix:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return hasPerfix;
    }
}

/**
 Returns a Boolean value that indicates whether a given string matches the ending characters of the receiver.
 It's similar to `hasSuffix:`, but it never throw exception.
 
 @param string A string.
 */
- (BOOL)ff_hasSuffix:(NSString *)string {
    BOOL hasSuffix = NO;
    @try {
        hasSuffix = [self ff_hasSuffix:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return hasSuffix;
    }
}

/**
 Returns a new string containing the characters of the receiver from the one at a given index to the end.
 It's similar to `substringFromIndex:`, but it never throw exception.
 
 @param from An index.
 */
- (NSString *)ff_substringFromIndex:(NSUInteger)from {
    NSString *subStr = nil;
    @try {
        subStr = [self ff_substringFromIndex:from];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return subStr;
    }
}

/**
 Returns a new string containing the characters of the receiver up to, but not including, the one at a given index.
 It's similar to `substringToIndex:`, but it never throw exception.
 
 @param to An index.
 */
- (NSString *)ff_substringToIndex:(NSUInteger)to {
    NSString *subStr = nil;
    @try {
        subStr = [self ff_substringToIndex:to];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return subStr;
    }
}

/**
 Returns a string object containing the characters of the receiver that lie within a given range.
 It's similar to `substringWithRange:`, but it never throw exception.
 
 @param range A range.
 */
- (NSString *)ff_substringWithRange:(NSRange)range {
    NSString *subStr = nil;
    @try {
        subStr = [self ff_substringWithRange:range];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return subStr;
    }
}

/**
 Returns the character at a given UTF-16 code unit index.
 It's similar to `characterAtIndex:`, but it never throw exception.
 
 @param index The index of the character to retrieve.
 */
- (unichar)ff_characterAtIndex:(NSUInteger)index {
    unichar character;
    @try {
        character = [self ff_characterAtIndex:index];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return character;
    }
}

/**
 Returns a new string in which all occurrences of a target string in a specified range of the receiver are replaced by another given string.
 It's similar to `stringByReplacingOccurrencesOfString:withString:options:range:`, but it never throw exception.
 
 @param target The string to replace.
 @param replacement The string with which to replace target.
 @param options A mask of options to use when comparing target with the receiver. Pass 0 to specify no options.
 @param searchRange The range in the receiver in which to search for target.
 
 @return A new string in which all occurrences of target, matched using options, in searchRange of the receiver are replaced by replacement.
 */
- (NSString *)ff_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    NSString *safeStr = nil;
    @try {
        safeStr = [self ff_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return safeStr;
    }
}

/**
 Returns a new string in which all occurrences of a target string in the receiver are replaced by another given string.
 It's similar to `stringByReplacingOccurrencesOfString:withString:`, but it never throw exception.
 
 @param target The string to replace.
 @param replacement The string with which to replace target.
 
 @return A new string in which all occurrences of target in the receiver are replaced by replacement.
 */
- (NSString *)ff_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    NSString *safeStr = nil;
    @try {
        safeStr = [self ff_stringByReplacingOccurrencesOfString:target withString:replacement];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return safeStr;
    }
}

/**
 Returns a new string in which the characters in a specified range of the receiver are replaced by a given string.
 It's similar to `stringByReplacingCharactersInRange:withString:`, but it never throw exception.
 
 @param range A range of characters in the receiver.
 @param replacement The string with which to replace the characters in range.
 
 @return A new string in which the characters in range of the receiver are replaced by replacement.
 */
- (NSString *)ff_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    NSString *safeStr = nil;
    @try {
        safeStr = [self ff_stringByReplacingCharactersInRange:range withString:replacement];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return safeStr;
    }
}

/**
 Replaces the characters in the given range with the characters of the given string.
 It's similar to `replaceCharactersInRange:withString:`, but it never throw exception.
 
 @param range A range specifying the characters to replace.
 @param string A string specifying the characters to replace those in aRange.
 */
- (void)ff_replaceCharactersInRange:(NSRange)range withString:(NSString *)string {
    @try {
        [self ff_replaceCharactersInRange:range withString:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Replaces all occurrences of a given string in a given range with another given string, returning the number of replacements.
 It's similar to `replaceOccurrencesOfString:withString:options:range:`, but it never throw exception.
 
 @param target The string to replace.
 @param replacement The string with which to replace target.
 @param options A mask specifying search options.
 @param searchRange The range of characters to replace.
 
 @return The number of replacements made.
 */
- (NSUInteger)ff_replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    NSUInteger index = 0;
    @try {
        index = [self ff_replaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
        return index;
    }
}

/**
 Inserts into the receiver the characters of a given string at a given location.
 It's similar to `insertString:atIndex:`, but it never throw exception.
 
 @param string The string to insert into the receiver.
 @param index The location at which aString is inserted.
 */
- (void)ff_insertString:(NSString *)string atIndex:(NSUInteger)index {
    @try {
        [self ff_insertString:string atIndex:index];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Removes from the receiver the characters in a given range.
 It's similar to `insertString:atIndex:`, but it never throw exception.
 
 @param range The range of characters to delete.
 */
- (void)ff_deleteCharactersInRange:(NSRange)range {
    @try {
        [self ff_deleteCharactersInRange:range];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Adds to the end of the receiver the characters of a given string.
 It's similar to `appendString:`, but it never throw exception.
 
 @param string The string to append to the receiver.
 */
- (void)ff_appendString:(NSString *)string {
    @try {
        [self ff_appendString:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

/**
 Replaces the characters of the receiver with those in a given string.
 It's similar to `setString:`, but it never throw exception.
 
 @param string The string with which to replace the receiver's content.
 */
- (void)ff_setString:(NSString *)string {
    @try {
        [self ff_setString:string];
    } @catch (NSException *exception) {
        //Crash info
        [FFSafeHelper ff_crashInfoOfException:exception];
    } @finally {
    }
}

@end
