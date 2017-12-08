//
//  WorkSigle.m
//  DefineTest
//
//  Created by 超级犀牛 on 2017/12/8.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import "WorkSigle.h"

@implementation WorkSigle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(0);
    }
    return self;
}

- (void)wait {
//    NSLog(@"wait tag=%i, %@",self.tag,self.semaphore);
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
};

- (void)signal {
//    NSLog(@"signal tag=%i, %@",self.tag,self.semaphore);
    dispatch_semaphore_signal(self.semaphore);
}


@end
