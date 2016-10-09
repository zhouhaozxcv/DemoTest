//
//  NodeListViewController.m
//  Demo
//
//  Created by 梁晨 on 16/10/9.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "NodeListViewController.h"
#import "NodeManager.h"
#import "NSArray+Checking.h"

@interface NodeListViewController ()

@end

@implementation NodeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.titles = @[@"单链表的创建",
                    @"循环链表的创建",
                    @"双链表的创建",
                    @"判断单链表中是否有环",
                    @"判断环的起始位置",
                    @"判断环的长度",
                    @"翻转单链表",
                    @"递归的办法翻转单链表"];
    self.selNames = @[@"createNodeList",
                      @"createNodeListLoop",
                      @"createNodeListDoubly",
                      @"isExistLoopInNodeList",
                      @"loopStartLocation",
                      @"loopStartLength",
                      @"reverseSinglyNodeList",
                      @"reverseSinglyNodeListWithRecursive"
                      ];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selName = [self.selNames objectAtIndex:indexPath.row];
    if (selName && selName.length > 0) {
        SEL sel = NSSelectorFromString(selName);
        IMP imp = [self methodForSelector:sel];
        imp();
//        [self performSelector:sel withObject:nil afterDelay:0];
        
    }
}


- (void)createNodeList{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:6];
    [node printNodeList:node.head];
}

- (void)createNodeListLoop{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:6 loop:YES doubly:NO];
}

- (void)createNodeListDoubly{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:6 loop:NO doubly:YES];
}

- (void)isExistLoopInNodeList{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:10 start:5];
    NSLog(@"%@",([node isExistLoop:node.head])?@"存在":@"不存在");
}

- (void)loopStartLocation{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:10 start:5];
    NSLog(@"%d",node.loopStart);
}

- (void)loopStartLength{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:10 start:5];
    NSLog(@"%d",node.loopLength);
}

- (void)reverseSinglyNodeList{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:10];
    [node reverseSinglyNodeList:node.head];
    [node printNodeList:node.head];
}


- (void)reverseSinglyNodeListWithRecursive{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:10];
    [node reverseSinglyNodeList:node.head];
    [node printNodeList:node.head];
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
