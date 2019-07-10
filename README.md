![FFSafeKit](/Resources/ffsafekit-logo.png)

<p align="center">
    <a href="https://travis-ci.org/JonyFang/FFSafeKit">
        <img src="https://travis-ci.org/JonyFang/FFSafeKit.svg?branch=master" alt="CI Status">
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
$ cd Shell && sh install-bundle.sh && sh install-pods.sh && cd ..
$ open FFSafeKit.xcworkspace
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

//Set `YES` to enable error logs for debug.
[FFSafeHelper ff_setupStatusToDebug:NO exceptionBlock:^(NSException * _Nonnull exception) {
    NSLog(@"== exception ==\n%@", exception);
}];
```


## License

`FFSafeKit` is available under the MIT license. See the [LICENSE](https://github.com/JonyFang/FFSafeKit/blob/master/LICENSE) file for more info.


