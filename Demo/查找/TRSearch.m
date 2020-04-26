//
//  TRSearch.m
//  DefineTest
//
//  Created by zhouhao on 2020/4/26.
//  Copyright © 2020 超级犀牛. All rights reserved.
//

#import "TRSearch.h"

@implementation TRSearch
+ (NSInteger)binarySearch:(NSArray *)temp target:(NSInteger)target{
    return [self binarySearch:temp target:target startFlag:0 endFlag:temp.count-1];
}

+ (NSInteger)binarySearch:(NSArray *)array target:(NSInteger)target startFlag:(NSInteger)startFlag endFlag:(NSInteger)endFlag{
    NSInteger res = -1;
    if (array.count > endFlag && endFlag >= startFlag && [array[startFlag] integerValue] <= target && [array[endFlag] integerValue] >= target) {
        NSInteger count = array.count;
        NSInteger midIdx = (endFlag-startFlag)/2+startFlag;
        
        if (count == midIdx+1 && [array[midIdx] integerValue] != target) {
            return res;
        }
        if ([array[midIdx] integerValue] == target) {
            res = midIdx;
            return res;
        }else if ([array[midIdx] integerValue] >= target){
            return [self binarySearch:array target:target startFlag:startFlag endFlag:midIdx];
        }else{
            return [self binarySearch:array target:target startFlag:midIdx+1 endFlag:endFlag];
        }
        return res;
    }
    return res;
}

@end
