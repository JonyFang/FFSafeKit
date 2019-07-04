![FFSafeKit](/Resources/ffsafekit-logo.png)

<p align="center">
    <a href="https://travis-ci.org/JonyFang/FFPopup">
        <img src="https://travis-ci.org/JonyFang/FFPopup.svg?branch=master" alt="CI Status">
    </a>
	<a href="http://cocoapods.org/pods/FFSafeKit">
        <img src="https://img.shields.io/cocoapods/v/FFSafeKit.svg" alt="Cocoapods Version">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible">
    </a>
    <a href="http://cocoapods.org/pods/FFSafeKit">
        <img src="https://img.shields.io/cocoapods/p/FFSafeKit.svg" alt="Platform">
    </a>
    <a href="LICENSE">
        <img src="https://img.shields.io/cocoapods/l/FFSafeKit.svg" alt="MIT License">
    </a>
    <a href="https://github.com/jonyfang/FFSafeKit/issues">
        <img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat" alt="FFSafeKit Issues">
    </a>
    <a href="http://twitter.com/jony_chunfang">
        <img src="https://img.shields.io/badge/twitter-@JonyFang-blue.svg?style=flat" alt="Twitter">
    </a>
</p>

<p align="center">Using NSArray, NSMutableArray, NSDictionary, NSMutableDictionary, NSMutableString safely by FFSafeKit.</p>


## Features

- Safely access `NSArray` 
- Safely access `NSDictionary`
- Safely access & perform changes to `NSMutableArray`
- Safely access & perform changes to `NSMutableDictionary`
- Safely access & perform changes to `NSMutableString`

## Requirements

- iOS 8.0+ / macOS 10.13.6+
- Xcode 10.1 (10B61) +

## Example

To run the `FFSafeKit` project, clone the Repo, and start `FFSafeKit` in Xcode.

```bash
$ git clone https://github.com/JonyFang/FFSafeKit.git
$ cd FFSafeKit
$ open FFSafeKit.xcodeproj
```

## Installation

There are three ways to use FFSafeKit in your project:

- Installation with `CocoaPods`
- Installation with `Carthage`
- `Manually` install

### CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager, which automates and simplifies the process of using 3rd-party libraries like **FFSafeKit** in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'FFSafeKit'
```

If you want to use the latest features of **FFSafeKit** use normal external source dependencies.

```ruby
pod 'FFSafeKit', :git => 'https://github.com/JonyFang/FFSafeKit.git'
```

This pulls from the master branch directly.

Second, install **FFSafeKit** into your project:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate **FFSafeKit** into your Xcode project using Carthage, specify it in your `Cartfile`:

```ruby
github "JonyFang/FFSafeKit"
```

Run the following command to build the framework:

```bash
$ carthage update
```

Drag the built `FFSafeKit.framework` binaries from `Carthage/Build/iOS` into your application’s Xcode project.

On your application targets’ `Build Phases` settings tab, click the `+ icon` and choose `New Run Script Phase`. Create a `Run Script` in which you specify your shell (ex: `/bin/sh`), add the following contents to the script area below the shell:

```ruby
/usr/local/bin/carthage copy-frameworks
```

Add the following paths to the frameworks you want to use under `Input Files`.

```bash
$(SRCROOT)/Carthage/Build/iOS/FFSafeKit.framework
```

For an in depth guide, read on from [Adding frameworks to an application](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

### Manually

Alternatively you can directly add the `FFSafeKit folder` source files to your project.

- Download the [latest code version](https://github.com/JonyFang/FFSafeKit/blob/master) or add the repository as a git submodule to your git-tracked project.
- Open your project in Xcode, then drag and drop `FFSafeKit folder` onto your project (use the `"Product Navigator view"`). Make sure to select `Copy items` when asked if you extracted the code archive outside of your project.
- Include FFSafeKit wherever you need it with `#import "FFSafeKit.h"`.

## Usage

Import the library where you want to use it.

```objc
#import <FFSafeKit.h>
```

## What's FFSafeKit ?

- NSArray+FFSafeKit
- NSMutableArray+FFSafeKit
- NSDictionary+FFSafeKit
- NSMutableDictionary+FFSafeKit
- NSMutableString+FFSafeKit

### NSArray+FFSafeKit

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


### NSMutableArray+FFSafeKit

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

### NSDictionary+FFSafeKit

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

### NSMutableDictionary+FFSafeKit

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

### NSMutableString+FFSafeKit

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

## License

`FFSafeKit` is available under the MIT license. See the [LICENSE](https://github.com/JonyFang/FFSafeKit/blob/master/LICENSE) file for more info.


