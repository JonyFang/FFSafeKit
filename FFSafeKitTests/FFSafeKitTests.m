//
//  FFSafeKitTests.m
//  FFSafeKitTests
//
//  Created by JonyFang on 2019/7/4.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FFSafeKit.h"

@interface FFSafeKitTests : XCTestCase

@end

@implementation FFSafeKitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//NSArray safety checker
- (void)testSafeArray {
    NSArray *array = @[@"0", @"1", @"2", @"3"];
    
    //Index is equal to `array.count`
    NSString *equalIndex = array[4];
    XCTAssertEqual(equalIndex, nil, @"Index is equal to the value returned by `array.count`");
    
    //Index is greater than `array.count`
    NSString *greaterIndex = array[5];
    XCTAssertEqual(greaterIndex, nil, @"Index is greater than the value returned by `array.count`");
}

//NSMutableArray safety checker
- (void)testSafeMutableArray {
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:@[@"0", @"1", @"2", @"3"]];
    
    //Index is equal to `mArray.count`
    NSString *equalIndex = mArray[4];
    XCTAssertEqual(equalIndex, nil, @"Index is equal to the value returned by `mArray.count`");
    
    //Index is greater than `mArray.count`
    NSString *greaterIndex = mArray[5];
    XCTAssertEqual(greaterIndex, nil, @"Index is greater than the value returned by `mArray.count`");
}

@end
