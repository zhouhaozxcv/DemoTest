//
//  ZHOperationQueue.h
//  DefineTest
//
//  Created by 超级犀牛 on 2017/10/30.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHOperation.h"




@interface ZHOperationQueue : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary *operations;///<操作集合
@property (nonatomic, strong) ZHOperation *operating;///<正在执行的操作

+ (ZHOperationQueue *)currentQueue;

///添加operation到queue
- (void)addOperation:(ZHOperation *)operation;
- (BOOL)insertOperation:(ZHOperation *)operation afterOperation:(ZHOperation *)afterOperation;

///停止正在操作的operation
- (void)endOperating;
- (void)endOperatingToNext;

///获取一个operation
- (ZHOperation *)getOperation;
- (ZHOperation *)getOperationToRun;
@end
