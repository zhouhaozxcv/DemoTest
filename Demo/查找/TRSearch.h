//
//  TRSearch.h
//  DefineTest
//
//  Created by zhouhao on 2020/4/26.
//  Copyright © 2020 超级犀牛. All rights reserved.
//
//  查找
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRSearch : NSObject

/**
 *  二分查找
 *  @param  temp    需要查找的数组
 *  @param  target  目标
 *  @return NSInteger   返回target所在数组下标 ，-1未找到
 */
+ (NSInteger)binarySearch:(NSArray *)temp target:(NSInteger)target;

@end

NS_ASSUME_NONNULL_END
