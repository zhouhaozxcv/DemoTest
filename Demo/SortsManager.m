//
//  SortsManager.m
//  Demo
//
//  Created by lc on 16/8/31.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "SortsManager.h"

@implementation SortsManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)ggg{
    self.blocka(@"aa");
}

//插入排序
+ (NSArray *)sortWithStraightInsertion:(NSArray *)array{
    NSMutableArray *arrayM = [array mutableCopy];
    for (NSInteger i = 1; i < arrayM.count; i++) {
        
        NSInteger j = i-1;
        NSNumber *temp = arrayM[i];//复制为哨兵，即存储待排序的元素
        while (j>=0 && temp.integerValue < [arrayM[j] integerValue]) {
            arrayM[j+1] = arrayM[j];
            j--;
        }
        arrayM[j+1] = temp;
        
        NSLog(@"第%ld次排序：%@",(long)i,arrayM) ;
    }
    
    return arrayM;
}

///简单选择
+ (NSArray *)sortWithSimpleSelection:(NSArray *)array{
    NSMutableArray *arrayM = [array mutableCopy];
    
    for (NSInteger i = 0; i < arrayM.count; i++) {
        NSInteger minKey = i;
        for (NSInteger j = i+1; j < arrayM.count; j++) {
            if ([arrayM[minKey] integerValue] > [arrayM[j] integerValue]) {
                minKey = j;
            }
        }
        
        if (minKey != i) {
            NSNumber *tmp = arrayM[i];
            arrayM[i] = arrayM[minKey];
            arrayM[minKey] = tmp;
        }
        
        NSLog(@"%@",arrayM);
        
    }
    
    return arrayM;
}

//冒泡排序
+ (NSArray *)sortWithBubble:(NSArray *)array{
    NSMutableArray *arrayM = [array mutableCopy];
    
    for (NSInteger i = 0; i < arrayM.count-1; i++) {
        for (NSInteger j = 0; j < arrayM.count - i - 1; j++) {
            if ([arrayM[j] integerValue] > [arrayM[j+1] integerValue]) {
                NSNumber *tmp = arrayM[j];
                arrayM[j] = arrayM[j+1];
                arrayM[j+1] = tmp;
            }
        }
        NSLog(@"%@",arrayM);
    }
    
    return arrayM;
}

//快速排序
+ (NSArray *)sortWithQuick:(NSMutableArray *)array low :(NSInteger)low high:(NSInteger) high{
    //@[@8,@6,@676,@432,@2,@4,@123];
    if (low < high) {
        NSInteger privotloc = [self partition:array low:low high:high];
        NSLog(@"%ld",privotloc);
        [self sortWithQuick:array low:low high:privotloc-1];
        [self sortWithQuick:array low:privotloc+1 high:high];
    }
    NSLog(@"%@",array);
    return array;
}

+ (NSInteger)partition:(NSMutableArray *)array low :(NSInteger)low high:(NSInteger) high{
    NSNumber *privotKey = array[low];//基准元素
    NSInteger keyNum = low;
    
    while (low < high) {//从表的两端交替地向中间扫描
        while (low < high && [array[high] integerValue] >= [privotKey integerValue]) {//从high 所指位置向前搜索，至多到low+1 位置。将比基准元素小的交换到低端
            --high;
        }
//        [self swapWithArray:array low:low high:high];
        
        while (low < high && [array[low] integerValue] <= [privotKey integerValue]) {//从low 所指位置向前搜索，至多到high-1 位置。将比基准元素大的交换到高端
            ++low;
        }
        [self swapWithArray:array low:low high:high];
        
        
//        NSLog(@"快速排序：%@",array) ;
    }
    if ([array[low] integerValue] > [privotKey integerValue]) {
        [self swapWithArray:array low:keyNum high:low-1];
    }else{
        [self swapWithArray:array low:keyNum high:low];
    }
    
    
    return low;
}

+ (void)swapWithArray:(NSMutableArray *)array low:(NSInteger )low high:(NSInteger )high {
    NSNumber *temp = array[low];
    array[low] = array[high];
    array[high] = temp;
}


///快速排序-->非递归方法
+ (NSArray *)sortWithQuickNoRecursion:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high{
    if (low < high) {
        NSMutableArray *stacks = [[NSMutableArray alloc] init];
        
        if (low < high) {
            [stacks addObject:@(low)];
            [stacks addObject:@(high)];
        }
        
        while (stacks.count > 0) {
            
            NSInteger end = [stacks.lastObject integerValue];
            [stacks removeLastObject];
            NSInteger start = [stacks.lastObject integerValue];
            [stacks removeLastObject];
            
            NSInteger mid = [self partition:array low:start high:end];
            if (start < mid-1) {
                [stacks addObject:@(low)];
                [stacks addObject:@(mid-1)];
            }
            
            if (mid+1<end) {
                [stacks addObject:@(mid+1)];
                [stacks addObject:@(end)];
            }
            
            
            NSLog(@"stacks.count = %lu ;array = %@",(unsigned long)stacks.count,array);
        }
    }

    return array;
}

+ (void)ceshiBlock:(void(^)(id a))block{
    block(@123);
}

@end
