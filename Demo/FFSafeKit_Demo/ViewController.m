//
//  ViewController.m
//  FFSafeKit_Demo
//
//  Created by JonyFang on 2019/7/9.
//  Copyright © 2019 JonyFang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArray];
}

- (void)testArray {
    NSArray *array = @[@"0", @"1", @"2", @"3"];
    
    //Index is equal to `array.count`
    NSString *equalIndex = array[4];
    NSLog(@"equal index item = %@", equalIndex);
    
    //Index is greater than `array.count`
    NSString *greaterIndex = array[5];
    NSLog(@"greater index item = %@", greaterIndex);
}


@end
