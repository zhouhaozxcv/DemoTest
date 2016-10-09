//
//  TransformManager.m
//  Demo
//
//  Created by 梁晨 on 16/10/8.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "TransformManager.h"

@implementation TransformManager


+ (NSString *)decimalToBinary:(NSInteger)decimalNum{
    BOOL plus = YES;
    if (decimalNum < 0) {
        plus = NO;
        decimalNum = -decimalNum;
    }
    
    if (decimalNum == 0) {
        return @"0";
    }
    
    if (decimalNum <= 1 && decimalNum >= 0) {
        return [NSString stringWithFormat:@"%ld",(long)decimalNum];
    }
    
    NSString *result = [self decimalToBinary:decimalNum/2];
    NSInteger temp = decimalNum % 2;
    
    
    if (plus) {
        return [result stringByAppendingFormat:@"%ld",(long)temp];
    }else{
        for (NSInteger i = 0; i < result.length; i++) {
            NSInteger tempNum = [[result substringWithRange:NSMakeRange(i, 1)] integerValue];
            if (tempNum == 0) {
                result = [result stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"1"];
            }else{
                result = [result stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"0"];
            }
        }
        return [result stringByAppendingFormat:(temp == 0) ? @"1" : @"0"];
    }
}

+ (NSInteger)binaryToDecimal:(NSString *)binary{
    
    NSInteger bLength = binary.length;
    NSInteger result = 0;
    
    for (NSInteger i = 0; i < bLength; i++) {
        NSString *sTemp = [binary substringWithRange:NSMakeRange(i, 1)];
        NSString *number = @"^[0-9]d*$";
        NSPredicate *regextestNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
        BOOL rBool = [regextestNumber evaluateWithObject:sTemp];
        
        if (sTemp.integerValue > 1 || sTemp.integerValue < 0 || !rBool) {
            return -1;
        }
        NSInteger temp = [sTemp integerValue];
        
        double m = pow(2, bLength-i-1);
        result += (NSInteger)(temp * m);
    }

    
    return result;
}

+ (NSString *)decimalToHex:(NSInteger)decimalNum{
    BOOL plus = YES;
    if (decimalNum < 0) {
        plus = NO;
        decimalNum = -decimalNum;
    }
    NSString *switchString = @"0123456789ABCDEF";
    
    if (decimalNum < 16 && decimalNum >= 0) {
        return (plus)?[switchString substringWithRange:NSMakeRange(decimalNum, 1)]:[NSString stringWithFormat:@"-%@",[switchString substringWithRange:NSMakeRange(decimalNum, 1)]];
    }
    
    NSString *result = [self decimalToHex:decimalNum/16];
    NSInteger temp = decimalNum % 16;
    NSString *sTemp = [switchString substringWithRange:NSMakeRange(temp, 1)];
    
    return (plus)?[result stringByAppendingFormat:@"%@",sTemp]:[NSString stringWithFormat:@"-%@",[result stringByAppendingFormat:@"%@",sTemp]];
}


+ (NSString *)hexToDecimal:(NSString *)hex{
    
    
    return @"";
}

@end
