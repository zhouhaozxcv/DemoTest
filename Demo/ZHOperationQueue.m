//
//  ZHOperationQueue.m
//  DefineTest
//
//  Created by 超级犀牛 on 2017/10/30.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import "ZHOperationQueue.h"

@interface ZHOperationQueue()

@property (nonatomic, strong) NSMutableArray *operationKeys;
@end

@implementation ZHOperationQueue
@synthesize operations = _operations;

static ZHOperationQueue *instance;
+ (ZHOperationQueue *)currentQueue{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[super alloc] init];
            [instance prepareQueue];
        }
    });
    return instance;
}

- (void)prepareQueue{
    _operations = [[NSMutableDictionary alloc] init];
    self.operationKeys = [[NSMutableArray alloc] init];
}

- (void)addOperation:(ZHOperation *)operation{
    NSAssert(operation != nil, @"Operation is nil");
    NSAssert(operation.operationId != nil, @"Operation.operationId is nil");
    if (operation) {
        self.operations[operation.operationId] = operation;
        [self.operationKeys addObject:operation.operationId];
    }
}

- (BOOL)insertOperation:(ZHOperation *)operation afterOperation:(ZHOperation *)afterOperation{
    NSAssert(operation!=nil, @"Operation is nil");
    NSAssert(afterOperation!=nil, @"afterOperation is nil");
    
    if (operation) {
        if (afterOperation) {
            NSInteger index = [self.operationKeys indexOfObject:afterOperation.operationId];
            self.operations[operation.operationId] = operation;
            [self.operationKeys insertObject:operation atIndex:index+1];
        }else{
            [self addOperation:operation];
        }
    }
    return NO;
}

- (void)endOperating{
    [self.operations removeObjectForKey:self.operating.operationId];
    [self.operationKeys removeObject:self.operating.operationId];
    self.operating = nil;
}

- (void)endOperatingToNext{
    [self endOperating];
    [self getOperationToRun];
}

- (ZHOperation *)getOperation{
    ZHOperation *operation = self.operations[self.operationKeys.firstObject];
    self.operating = operation;
    return operation;
}

- (ZHOperation *)getOperationToRun{
    ZHOperation *operation = [self getOperation];
    if (operation.executeBlock) {
        operation.executeBlock(operation);
    }
    return operation;
}

@end
