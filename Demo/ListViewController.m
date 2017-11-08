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

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles = @[@"链表",
                @"二进制、十进制、十六进制之间的转换",
                @"app启动之后，各种alert的消息弹出的消息队列" ];
    self.selNames = @[@"nodeManager",
                  @"transformManager"
                  @"appLaunchFinishToAlerts"];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selName = [self.selNames objectAtIndex:indexPath.row];
    
    if (selName && selName.length > 0) {
        SEL sel = NSSelectorFromString(selName);
//        IMP imp = [self methodForSelector:sel];
//        imp();
        [self performSelector:sel withObject:nil afterDelay:0];
        
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
