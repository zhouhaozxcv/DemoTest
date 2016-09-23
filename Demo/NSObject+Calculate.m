//
//  NSObject+Calculate.m
//  Demo
//
//  Created by lc on 16/8/18.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "NSObject+Calculate.h"

@implementation NSObject (Calculate)

+ (NSInteger)makeCalculate:(void (^)(CalculateMaker *make))calculateMaker{
    CalculateMaker *maker = [[CalculateMaker alloc] init];
    calculateMaker(maker);
    return maker.result;
}

@end

@implementation CalculateMaker

- (CalculateMaker *(^)(NSInteger))add{
    return ^CalculateMaker *(NSInteger value) {
        NSLog(@"%ld",(long)value);
        _result += value;
        return self;
    };
}

- (void (^)(NSInteger))muilt{
    return ^void(NSInteger value) {
        _result += value;
    };
}

- (CalculateMaker *)bbb{
    NSLog(@"%s",__FUNCTION__);
    return self;
}
@end
