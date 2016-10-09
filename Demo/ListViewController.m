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

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titles = @[@"链表",
                @"二进制、十进制、十六进制之间的转换",
                @"a" ];
    self.selNames = @[@"nodeManager",
                  @"transformManager"
                  ];
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
