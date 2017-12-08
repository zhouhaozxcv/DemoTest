//
//  Semaphore.h
//  DefineTest
//
//  Created by 超级犀牛 on 2017/12/8.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  使用信号量
 *  eg. 当线程2完成时，启动1的信号量（等待1的信号），当1完成时，发送信号，这时2接收到，然后执行2剩下的代码
 */
@interface Semaphore : NSObject



@end
