//
//  FFSafeHelper.m
//  FFSafeKit
//
//  Created by JonyFang on 2019/7/9.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "FFSafeHelper.h"

@implementation FFSafeHelper
static FFSafeHelper *instance;
static dispatch_once_t onceToken;

+ (instancetype)shareInstance {
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
        instance.enableSafeKitDebug = NO;
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [FFSafeHelper shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return [FFSafeHelper shareInstance];
}

- (void)resetInstance {
    onceToken = 0;
    instance = nil;
}

#pragma mark - Public Methods
+ (void)ff_setupStatusToDebug:(BOOL)isDebug exceptionBlock:(FFSafeHelperExceptionBlock)block {
    [FFSafeHelper shareInstance].enableSafeKitDebug = isDebug;
    [FFSafeHelper shareInstance].safeHelperExceptionBlock = block;
}

+ (void)ff_crashInfoOfException:(NSException *)exception {
    NSString *name = [NSString stringWithFormat:@"\t >>> Name: %@", exception.name];
    NSString *reason = [NSString stringWithFormat:@"\t >>> Reason: %@", exception.reason];
    NSString *callStackSymbols = [NSString stringWithFormat:@"\t >>> Call Stack Symbols: \n%@", [NSThread callStackSymbols]];
    NSString *crashInfo = [NSString stringWithFormat:@"\n>>>>>>>>>> Crash Info >>>>>>>>>>\n%@\n%@\n%@\n<<<<<<<<<< Crash Info <<<<<<<<<<", name, reason, callStackSymbols];
    
    //Safe exception block
    NSDictionary *userInfo = @{@"callStackSymbols": [NSString stringWithFormat:@"%@", [NSThread callStackSymbols]]};
    NSException *temp = [NSException exceptionWithName:exception.name reason:exception.reason userInfo:userInfo];
    if ([FFSafeHelper shareInstance].safeHelperExceptionBlock) {
        [FFSafeHelper shareInstance].safeHelperExceptionBlock(temp);
    }
    
    //Log crash info
    if ([FFSafeHelper shareInstance].enableSafeKitDebug) {
        NSAssert(NO, crashInfo);
    } else {
        //
    }
}

@end
