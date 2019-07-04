//
//  NSDictionary+FFSafeImp.h
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/3.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FFSafeImp)

/**
 Exchanges the implementations of two methods.
 
 @param systemMethodString System method name.
 @param systemClassString System class name.
 @param safeMethodString Safe-custom method name.
 @param targetClassString Target class name.
 */
+ (void)ff_swizzlingMethod:(NSString *)systemMethodString
         systemClassString:(NSString *)systemClassString
        toSafeMethodString:(NSString *)safeMethodString
         targetClassString:(NSString *)targetClassString;

@end

NS_ASSUME_NONNULL_END
