//
//  ZHOperation.h
//  DefineTest
//
//  Created by 超级犀牛 on 2017/10/30.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void(^OperationStartExecuteBlock)(id x);


@interface ZHOperation : NSObject


@property (nonatomic, copy, readonly) NSString *operationId;

//@property (nonatomic, strong, readonly) ZHOperation *dependencyOperation;

@property (nonatomic, readonly) BOOL autoRunWhenDependencyOperationFinished;

@property (nonatomic, copy) OperationStartExecuteBlock executeBlock;

///开始执行操作
- (ZHOperation *)execute:(void(^)(id x))execute;

/////添加依赖 - 目前的依赖只是添加一个操作到依赖操作的后面，即强制插入一个操作到队列的某个位置
//- (ZHOperation *)addDependency:(ZHOperation *)operation autoRun:(BOOL)run;

///处理/操作结束
- (void)dispose;
@end
