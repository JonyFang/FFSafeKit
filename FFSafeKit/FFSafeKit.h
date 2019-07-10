//
//  FFSafeKit.h
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/4.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<FFSafeKit/FFSafeKit.h>)

FOUNDATION_EXPORT double FFSafeKitVersionNumber;
FOUNDATION_EXPORT const unsigned char FFSafeKitVersionString[];

#import <FFSafeKit/FFSafeHelper.h>
#import <FFSafeKit/NSArray+FFSafeKit.h>
#import <FFSafeKit/NSMutableArray+FFSafeKit.h>
#import <FFSafeKit/NSDictionary+FFSafeKit.h>
#import <FFSafeKit/NSMutableDictionary+FFSafeKit.h>
#import <FFSafeKit/NSMutableString+FFSafeKit.h>

#else

#import "FFSafeHelper.h"
#import "NSArray+FFSafeKit.h"
#import "NSMutableArray+FFSafeKit.h"
#import "NSDictionary+FFSafeKit.h"
#import "NSMutableDictionary+FFSafeKit.h"
#import "NSMutableString+FFSafeKit.h"

#endif
