//
//  SortsManager.h
//  Demo
//
//  Created by lc on 16/8/31.
//  Copyright © 2016年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SortsManager : NSObject


@property (nonatomic, copy) void(^blocka)(NSString *a);

- (void)ggg;

///简单插入排序
+ (NSArray *)sortWithStraightInsertion:(NSArray *)array;

///简单选择排序
+ (NSArray *)sortWithSimpleSelection:(NSArray *)array;


///冒泡排序
+ (NSArray *)sortWithBubble:(NSArray *)array;


///快速排序-->递归方法
+ (NSArray *)sortWithQuick:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high;

///快速排序-->非递归方法
+ (NSArray *)sortWithQuickNoRecursion:(NSMutableArray *)array low :(NSInteger)low high:(NSInteger) high;


+ (void)ceshiBlock:(void(^)(id a))block;

@end
