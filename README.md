
# FFSafeKit

## How to use FFSafeKit ?

Just import the library where you want to use it, then it will work automatically. No longer have to add any other code.

```objc
#import "FFSafeKit.h"
```

## What's FFSafeKit ?

- NSArray
- NSMutableArray
- NSDictionary
- NSMutableDictionary
- NSMutableString

### NSArray

```objc
/**
 Returns the object(from `__NSArrayI`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_objectAtIndex:(NSUInteger)index;

/**
 Returns the object(from `__NSSingleObjectArrayI`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index;

/**
 Returns the object(from `__NSArray0`) located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_zeroObjectAtIndex:(NSUInteger)index;

/**
 Returns the object(from `__NSArrayI`) at the specified index, or return nil when out of bounds.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)index;
```


### NSMutableArray

```objc
/**
 Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (id)safeMutable_objectAtIndex:(NSUInteger)index;

/**
 Removes from the array each of the objects within a given range, or return when out of bounds.
 It's similar to `removeObjectsInRange:`, but it never throw exception.
 
 @param range The range of the objects to be removed from the array.
 */
- (void)safeMutable_removeObjectsInRange:(NSRange)range;

/**
 Removes all occurrences within a specified range in the array of a given object, or return when `object` is nil or `index` is greater than the count of elements in the array.
 
 @param object The object to be removed from the array’s content.
 @param range The range from which to remove anObject.
 */
- (void)safeMutable_removeObject:(id)object inRange:(NSRange)range;

/**
 Inserts a given object into the array’s contents at a given index, or return when `object` is nil or `index` is greater than the count of elements in the array.
 
 @param object The object to add to the array's content.
 @param index The index in the array at which to insert anObject.
 */
- (void)safeMutable_insertObject:(id)object atIndex:(NSUInteger)index;

/**
 Returns the object at the specified index, or return nil when out of bounds.
 It's similar to `objectAtIndexedSubscript:`, but it never throw exception.
 
 @param index An index within the bounds of the array.
 */
- (id)safeMutable_objectAtIndexedSubscript:(NSUInteger)index;
```

### NSDictionary

```objc
/**
 Initializes a newly allocated dictionary with the specified number of key-value pairs constructed from the provided C arrays of keys and objects.
 It's similar to `initWithObjects:forKeys:count:`, but it never throw exception.
 
 @param objects A C array of values for the new dictionary.
 @param keys A C array of keys for the new dictionary. Each key is copied (using copyWithZone:; keys must conform to the NSCopying protocol), and the copy is added to the new dictionary.
 @param count The number of elements to use from the keys and objects arrays. count must not exceed the number of elements in objects or keys.
 */
- (instancetype)initWithObjects_safe:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count;
```

### NSMutableDictionary

```objc
/**
 Removes a given key and its associated value from the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param key The key to remove.
 */
- (void)safeMutable_removeObjectForKey:(id<NSCopying>)key;

/**
 Adds a given key-value pair to the dictionary.
 It's similar to `removeObjectForKey:`, but it never throw exception.
 
 @param object The value for aKey. A strong reference to the object is maintained by the dictionary.
 @param key The key for value. The key is copied (using `copyWithZone:`; keys must conform to the NSCopying protocol). If aKey already exists in the dictionary, anObject takes its place.
 */
- (void)safeMutable_setObject:(id)object forKey:(id<NSCopying>)key;
```

### NSMutableString

```objc
/**
 Returns a new string containing the characters of the receiver from the one at a given index to the end.
 It's similar to `substringFromIndex:`, but it never throw exception.
 
 @param from An index.
 */
- (NSString *)safeMutable_substringFromIndex:(NSUInteger)from;

/**
 Returns a new string containing the characters of the receiver up to, but not including, the one at a given index.
 It's similar to `substringToIndex:`, but it never throw exception.
 
 @param to An index.
 */
- (NSString *)safeMutable_substringToIndex:(NSUInteger)to;

/**
 Finds and returns the range of the first occurrence of a given string within a given range of the string, subject to given options, using the specified locale, if any.
 It's similar to `rangeOfString:options:range:locale:`, but it never throw exception.
 
 @param searchString The string for which to search.
 @param mask A mask specifying search options. The following options may be specified by combining them with the C bitwise OR operator: NSCaseInsensitiveSearch, NSLiteralSearch, NSBackwardsSearch, and NSAnchoredSearch. See String Programming Guide for details on these options.
 @param rangeOfReceiverToSearch The range within the receiver for which to search for aString.
 @param locale The locale to use when comparing the receiver with aString. To use the current locale, pass `[NSLocale currentLocale]`. To use the system locale, pass nil.
 @return An NSRange structure giving the location and length in the receiver of aString within aRange in the receiver, modulo the options in mask. The range returned is relative to the start of the string, not to the passed-in range. Returns `{NSNotFound, 0}` if aString is not found or is empty ("").
 */
- (NSRange)safeMutable_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale;

/**
 Returns a string object containing the characters of the receiver that lie within a given range.
 It's similar to `substringWithRange:`, but it never throw exception.
 
 @param range A range.
 */
- (NSString *)safeMutable_substringWithRange:(NSRange)range;

/**
 Adds to the end of the receiver the characters of a given string.
 It's similar to `appendString:`, but it never throw exception.
 
 @param string The string to append to the receiver.
 */
- (void)safeMutable_appendString:(NSString *)string;
```


