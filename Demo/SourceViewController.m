//
//  SourceViewController.m
//  Demo
//
//  Created by 梁晨 on 16/10/9.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "SourceViewController.h"
#import "NodeManager.h"
#import "TransformManager.h"
#import "NSArray+Checking.h"

@interface SourceViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSArray *_titles;
    NSArray *_selNames;
}

@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titles = @[@"链表",
                @"二进制、十进制、十六进制之间的转换",
                @"a"
                ];
    _selNames = @[@"nodeManager",
              @"transformManager"
              ];
    
    SEL selBack = @selector(back:);
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.backgroundColor = [UIColor redColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [back addTarget:self action:selBack forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    
    [back setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:back attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:back attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
    [back addConstraint:[NSLayoutConstraint constraintWithItem:back attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:100]];
    [back addConstraint:[NSLayoutConstraint constraintWithItem:back attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:20]];
    
    
    
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:back attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"aa";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [_titles objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selName = [_selNames objectAtIndex:indexPath.row];
    if (selName && selName.length > 0) {
        SEL sel = NSSelectorFromString(selName);
        IMP imp = [self methodForSelector:sel];
        imp();
    }
}


- (void)nodeManager{
    NodeManager *node = [[NodeManager alloc] initWithNodeLength:6];
    [node printNodeList:node.head];
    [node reverseSinglyNodeListWithRecursive:node.head nextNode:node.head->next];
//    [node reverseSinglyNodeList:node.head];
    [node printNodeList:node.head];
//    NSLog(@"是否存在环：%@，  环的长度：%d  ,环的开始位置:%d",@([node isExistLoop:node.head]),node.loopLength,node.loopStart);
}

- (void)transformManager{
    NSLog(@"%@",[TransformManager decimalToHex:1000]);
}


- (void)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
