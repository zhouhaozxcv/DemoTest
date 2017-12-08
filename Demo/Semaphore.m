//
//  Semaphore.m
//  DefineTest
//
//  Created by 超级犀牛 on 2017/12/8.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import "Semaphore.h"
#import "WorkSigle.h"


@implementation Semaphore

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self worker];
    }
    return self;
}


- (void)worker {
    //创建一个保存信号量的数组
    //假设有100个任务，那么有99个任务需要等待上一个任务结束
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < 99; i++)
    {
        WorkSigle *w = [WorkSigle new];
        w.tag = i;
        [array addObject:w];
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        dispatch_async(queue, ^{
//            NSLog(@"start task %i",i);
            // do task
//            if (i==0) {
////                [NSThread sleepForTimeInterval:arc4random() % 60];
//            }else if (i==1){
//                [NSThread sleepForTimeInterval:10];
//            }else{
                [NSThread sleepForTimeInterval:arc4random() % 60/10];
//            }
            
            NSLog(@"do task %i",i);
            
            //wait a before task end
            if (i == 0) {
                //no before task
            } else {
                [array[i-1] wait];
            }
            
            //tell next task i'm end
            if (i == 100-1) {
                //no next
                //call back
                NSLog(@"        call back %i",i);
            } else {
                
                [array[i] signal];
                //call back
                NSLog(@"        call back %i",i);
            }
        });
    }
}


@end
