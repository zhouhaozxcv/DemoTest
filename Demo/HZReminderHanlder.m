//
//  HZReminderHanlder.m
//  DefineTest
//
//  Created by 超级犀牛 on 2017/11/7.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import "HZReminderHanlder.h"

static NSString *RemindBlockKeyString = @"remind";

@interface HZReminderHanlder()
@property (nonatomic, strong) NSMutableArray *reminderKeys;///待办事项的keys，以便获取事项的顺序
@end

@implementation HZReminderHanlder
@synthesize reminders = _reminders;

static HZReminderHanlder *instance;
+ (HZReminderHanlder *)defaultHandler{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[super alloc] init];
            [instance prepareDefaultHanlder];
        }
    });
    return instance;
}

- (void)prepareDefaultHanlder{
    _reminders = [[NSMutableDictionary alloc] init];
    self.reminderKeys = [[NSMutableArray alloc] init];
}

#pragma mark - Add
- (void)addReminder:(HZReminder *)reminder subscribe:(HZStartRemindBlock)remind{
    if (reminder && reminder.reminderId.length > 0) {
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
        temp[reminder.reminderId] = reminder;
        if (remind) temp[RemindBlockKeyString] = remind;
        _reminders[reminder.reminderId] = temp;
        [self.reminderKeys addObject:reminder.reminderId];
    }
}

- (BOOL)insertReminder:(HZReminder *)reminder atIndex:(NSInteger)index subscribe:(HZStartRemindBlock)remind{
    if (reminder && reminder.reminderId.length > 0) {
        if (self.reminderKeys.count > index) {
            NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
            temp[reminder.reminderId] = reminder;
            if (remind) temp[RemindBlockKeyString] = remind;
            _reminders[reminder.reminderId] = temp;
            [self.reminderKeys insertObject:reminder.reminderId atIndex:index];
        }else{
            [self addReminder:reminder subscribe:remind];
        }
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - Start
- (void)start{
    NSString *key = self.reminderKeys.firstObject;
    if (key.length > 0) {
        NSDictionary *temp = self.reminders[key];
        self.reminding = temp[key];
        [self.reminders removeObjectForKey:key];
        [self.reminderKeys removeObject:key];
        self.remindingFinish = NO;
        HZStartRemindBlock block = temp[RemindBlockKeyString];
        if (block) {
            block(self.reminding);
        }
    }
}

- (void)setRemindingFinish:(BOOL)remindingFinish{
    _remindingFinish = remindingFinish;
    if (remindingFinish == YES) {
        self.reminding = nil;
        [self performSelector:@selector(start) withObject:nil afterDelay:0.5];
    }
}

@end


#pragma mark - HZReminder
static NSString *Letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
@implementation HZReminder
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.reminderId = [self createReminderId];
    }
    return self;
}


- (NSString *)createReminderId{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSInteger len = 4;
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (NSInteger i = 0; i < len; i++) {
        NSInteger randomNumber = arc4random()%[Letters length];
        [randomString appendFormat:@"%C",[Letters characterAtIndex:randomNumber]];
    }
    NSString *temp = [NSString stringWithFormat:@"%.f%@",timestamp,randomString];
    return temp;
}
@end
