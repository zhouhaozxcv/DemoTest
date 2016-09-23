//
//  NSObject+Calculate.h
//  Demo
//
//  Created by lc on 16/8/18.
//  Copyright © 2016年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalculateMaker;
@interface NSObject (Calculate)

+ (NSInteger)makeCalculate:(void (^)(CalculateMaker *make))calculateMaker;

@end


@interface CalculateMaker : NSObject

@property (nonatomic ,assign) NSInteger result;

- (CalculateMaker *(^)(NSInteger))add;
//- (CalculateMaker *(^)(NSInteger))sub;
- (void (^)(NSInteger))muilt;

- (CalculateMaker *)bbb;

@end
