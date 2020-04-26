//
//  ListViewController.m
//  Demo
//
//  Created by 梁晨 on 16/10/9.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "ListViewController.h"
#import "NodeListViewController.h"
#import "NSArray+Checking.h"
#import "TransformViewController.h"
#import "HZReminderHanlder.h"
#import "Semaphore.h"
#import "TRSearch.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"查找",@"链表",
                @"二进制、十进制、十六进制之间的转换",
                @"app启动之后，各种alert的消息弹出的消息队列" ,
                    @"线程，信号量，n个线程顺序结束问题"];
    self.selNames = @[@"search",@"nodeManager",
                  @"transformManager",
                  @"appLaunchFinishToAlerts",
                      @"dispatchSemaphoreTurn"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *selName = [self.selNames objectAtIndex:indexPath.row];
    
    if (selName && selName.length > 0) {
        SEL sel = NSSelectorFromString(selName);
//        IMP imp = [self methodForSelector:sel];
//        imp();
        [self performSelector:sel withObject:nil afterDelay:0];
        
    }
}

- (void)search{
    NSArray *array = @[@[@1,@2,@3,@4],@[@2,@4,@6,@8],@[@3,@6,@9,@12],@[@4,@8,@12,@16]];
    NSInteger target = 4;
    
    for (NSInteger i = 0;i < array.count;i++) {
        NSArray *temp = array[i];
        NSInteger res = [TRSearch binarySearch:temp target:target];
        NSLog(@"第%@个数组，%@，index:%@",@(i),(res>-1)?@"找到":@"未找到",@(res));
    }
}

- (void)nodeManager{
    NodeListViewController *node = [[NodeListViewController alloc] init];
    [self.navigationController pushViewController:node animated:YES];
    
}

- (void)transformManager{
    TransformViewController *node = [[TransformViewController alloc] init];
    [self.navigationController pushViewController:node animated:YES];
}

- (void)dispatchSemaphoreTurn{
    Semaphore *m = [[Semaphore alloc] init];
}

- (void)appLaunchFinishToAlerts{
    [[HZReminderHanlder defaultHandler] addReminder:[[HZReminder alloc] init] subscribe:^(HZReminder *reminder) {
        NSLog(@"第一个 Reminder 执行");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HZReminderHanlder defaultHandler].remindingFinish = YES;
        });
    }];
    
    [[HZReminderHanlder defaultHandler] addReminder:[[HZReminder alloc] init] subscribe:^(HZReminder *reminder) {
        NSLog(@"第二个 Reminder 执行");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HZReminderHanlder defaultHandler].remindingFinish = YES;
        });
    }];
    
    [[HZReminderHanlder defaultHandler] start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
