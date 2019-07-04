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
 交换两个函数实现指针，参数均为 NSString 类型
 @param systemMethodString 系统方法名
 @param systemClassString 系统实现方法类名
 @param safeMethodString 自定义hook方法名
 @param targetClassString 目标实现类名
 */
+ (void)ff_swizzlingMethod:(NSString *)systemMethodString
         systemClassString:(NSString *)systemClassString
        toSafeMethodString:(NSString *)safeMethodString
         targetClassString:(NSString *)targetClassString;

@end

NS_ASSUME_NONNULL_END
