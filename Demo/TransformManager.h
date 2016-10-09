//
//  TransformManager.h
//  Demo
//
//  Created by 梁晨 on 16/10/8.
//  Copyright © 2016年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransformManager : NSObject


///十进制转换为二进制
+ (NSString *)decimalToBinary:(NSInteger)decimalNum;


///二进制转换为十进制，return -1，输入有误
+ (NSInteger)binaryToDecimal:(NSString *)binary;


///十进制转换为十六进制
+ (NSString *)decimalToHex:(NSInteger)decimalNum;


///十六进制转换为十进制
+ (NSString *)hexToDecimal:(NSString *)hex;

@end
