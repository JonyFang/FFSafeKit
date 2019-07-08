//
//  NSMutableString+FFSafeKit.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/4.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "NSMutableString+FFSafeKit.h"
#import "NSObject+FFSafeSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableString (FFSafeKit)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Exchange `substringFromIndex:`
        NSString *tmpSubFromStr = @"substringFromIndex:";
        NSString *tmpSafeSubFromStr = @"safeMutable_substringFromIndex:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSCFString")
                                  originalSelector:NSSelectorFromString(tmpSubFromStr)
                                       newSelector:NSSelectorFromString(tmpSafeSubFromStr)];
        
        //Exchange `substringToIndex:`
        NSString *tmpSubToStr = @"substringToIndex:";
        NSString *tmpSafeSubToStr = @"safeMutable_substringToIndex:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSCFString")
                                  originalSelector:NSSelectorFromString(tmpSubToStr)
                                       newSelector:NSSelectorFromString(tmpSafeSubToStr)];
        
        //Exchange `substringWithRange:`
        NSString *tmpSubRangeStr = @"substringWithRange:";
        NSString *tmpSafeSubRangeStr = @"safeMutable_substringWithRange:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSCFString")
                                  originalSelector:NSSelectorFromString(tmpSubRangeStr)
                                       newSelector:NSSelectorFromString(tmpSafeSubRangeStr)];
        
        //Exchange `rangeOfString:options:range:locale:`
        NSString *tmpRangeOfStr = @"rangeOfString:options:range:locale:";
        NSString *tmpSafeRangeOfStr = @"safeMutable_rangeOfString:options:range:locale:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSCFString")
                                  originalSelector:NSSelectorFromString(tmpRangeOfStr)
                                       newSelector:NSSelectorFromString(tmpSafeRangeOfStr)];
        
        //Exchange `appendString:`
        NSString *tmpAppendStr = @"appendString:";
        NSString *tmpSafeAppendStr = @"safeMutable_appendString:";
        [NSObject ff_exchangeInstanceMethodOfClass:NSClassFromString(@"__NSCFString")
                                  originalSelector:NSSelectorFromString(tmpAppendStr)
                                       newSelector:NSSelectorFromString(tmpSafeAppendStr)];
    });
}

#pragma mark - Implement Methods
/**
 Returns a new string containing the characters of the receiver from the one at a given index to the end.
 It's similar to `substringFromIndex:`, but it never throw exception.
 
 @param from An index.
 */
- (NSString *)safeMutable_substringFromIndex:(NSUInteger)from {
    if (from > self.length) {
        return nil;
    }
    return [self safeMutable_substringFromIndex:from];
}

/**
 Returns a new string containing the characters of the receiver up to, but not including, the one at a given index.
 It's similar to `substringToIndex:`, but it never throw exception.
 
 @param to An index.
 */
- (NSString *)safeMutable_substringToIndex:(NSUInteger)to {
    if (to > self.length ) {
        return nil;
    }
    return [self safeMutable_substringToIndex:to];
}

/**
 Finds and returns the range of the first occurrence of a given string within a given range of the string, subject to given options, using the specified locale, if any.
 It's similar to `rangeOfString:options:range:locale:`, but it never throw exception.
 
 @param searchString The string for which to search.
 @param mask A mask specifying search options. The following options may be specified by combining them with the C bitwise OR operator: NSCaseInsensitiveSearch, NSLiteralSearch, NSBackwardsSearch, and NSAnchoredSearch. See String Programming Guide for details on these options.
 @param rangeOfReceiverToSearch The range within the receiver for which to search for aString.
 @param locale The locale to use when comparing the receiver with aString. To use the current locale, pass `[NSLocale currentLocale]`. To use the system locale, pass nil.
 @return An NSRange structure giving the location and length in the receiver of aString within aRange in the receiver, modulo the options in mask. The range returned is relative to the start of the string, not to the passed-in range. Returns `{NSNotFound, 0}` if aString is not found or is empty ("").
 */
- (NSRange)safeMutable_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale {
    if (!searchString) {
        searchString = self;
    }
    if (rangeOfReceiverToSearch.location > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    if (rangeOfReceiverToSearch.length > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    if ((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length) > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }
    
    return [self safeMutable_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}

/**
 Returns a string object containing the characters of the receiver that lie within a given range.
 It's similar to `substringWithRange:`, but it never throw exception.
 
 @param range A range.
 */
- (NSString *)safeMutable_substringWithRange:(NSRange)range {
    if (range.location > self.length) {
        return nil;
    }
    if (range.length > self.length) {
        return nil;
    }
    if ((range.location + range.length) > self.length) {
        return nil;
    }
    
    return [self safeMutable_substringWithRange:range];
}

/**
 Adds to the end of the receiver the characters of a given string.
 It's similar to `appendString:`, but it never throw exception.
 
 @param string The string to append to the receiver.
 */
- (void)safeMutable_appendString:(NSString *)string {
    if (!string) {
        return;
    }
    return [self safeMutable_appendString:string];
}

@end
