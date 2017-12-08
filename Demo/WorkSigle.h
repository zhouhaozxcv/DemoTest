//
//  WorkSigle.h
//  DefineTest
//
//  Created by 超级犀牛 on 2017/12/8.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkSigle : NSObject
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic) int tag;
- (void)wait;
- (void)signal;
@end
