//
//  HZReminderHanlder.h
//  DefineTest
//
//  Created by 超级犀牛 on 2017/11/7.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HZReminder;

typedef void(^HZStartRemindBlock)(HZReminder *reminder);

@interface HZReminderHanlder : NSObject

/**
 *  待办事项的集合
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *reminders;

/**
 *  正在提醒中的事项
 */
@property (nonatomic, strong) HZReminder *reminding;

/**
 *  正在提醒中的事项是否已经完成了, 当正在处理的事项完成时，必须设置yes，下一个事项才可以执行。
 */
@property (nonatomic) BOOL remindingFinish;



+ (HZReminderHanlder *)defaultHandler;

/**
 *  添加reminder到队列
 *  @param reminder 添加的新待办事项
 *  @param remind 消息消费时的block回调
 */
- (void)addReminder:(HZReminder *)reminder subscribe:(HZStartRemindBlock)remind;

/**
 *  插入一个reminder到afterReminder 之后
 *  @param reminder 添加的新待办事项
 *  @param index 插入的位置。当index < reminders.count时，插入到相应位置，否则加到队列末尾
 *  @param remind 消息消费时的block回调
 *  @reture BOOL    yes成功  no失败
 */
- (BOOL)insertReminder:(HZReminder *)reminder atIndex:(NSInteger)index subscribe:(HZStartRemindBlock)remind;

/**
 *  开始处理消费队列
 */
- (void)start;

@end


#pragma mark - HZReminder
@interface HZReminder : NSObject

@property (nonatomic, copy) NSString *reminderId;
@property (nonatomic, copy) NSString *remindDesc;

@end
