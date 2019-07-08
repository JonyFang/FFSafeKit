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
 Exchanges the implementations of system-method for safe-method.
 
 @param systemMethodString The system selector of the method you want to retrieve.
 @param systemClassString The system class you want to inspect.
 @param safeMethodString The safe selector of the method you want to retrieve.
 @param targetClassString The safe class you want to inspect.
 */
+ (void)ff_swizzlingMethod:(NSString *)systemMethodString
         systemClassString:(NSString *)systemClassString
        toSafeMethodString:(NSString *)safeMethodString
         targetClassString:(NSString *)targetClassString;

@end

NS_ASSUME_NONNULL_END
