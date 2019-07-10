//
//  FFSafeHelper.h
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/9.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#define FFSafeKitLog(fmt, ...) NSLog(fmt, ##__VA_ARGS__)

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FFSafeHelperExceptionBlock) (NSException *exception);

@interface FFSafeHelper : NSObject

@property (nonatomic, assign) BOOL enableSafeKitDebug;
@property (nonatomic, copy) FFSafeHelperExceptionBlock safeHelperExceptionBlock;

+ (void)ff_setupStatusToDebug:(BOOL)isDebug exceptionBlock:(FFSafeHelperExceptionBlock)block;

+ (void)ff_crashInfoOfException:(NSException *)exception;

@end

NS_ASSUME_NONNULL_END
