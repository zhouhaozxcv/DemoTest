//
//  NodeManager.h
//  Demo
//
//  Created by 梁晨 on 16/9/23.
//  Copyright © 2016年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>


struct Node {
    int data;
    struct Node *next;
    struct Node *previous;
};

@interface NodeManager : NSObject

///头指针
@property (nonatomic) struct Node *head;


///是否需要设置为双向链表，默认NO不需要
@property (nonatomic, readonly, getter=isDoublyNodeList) BOOL doublyNodeList;


///是否需要设置为循环链表，默认NO不需要
@property (nonatomic, readonly, getter=isLoopNodeList) BOOL loopNodeList;

///特殊环链表，环开始的地方
@property (nonatomic, readonly) int loopStart;


///环的长度
@property (nonatomic, readonly) int loopLength;

#pragma mark - init
///初始化链表
- (instancetype)initWithNodeLength:(int)length;


///初始化链表，是否是循环，是否是双向链表
- (instancetype)initWithNodeLength:(int)length loop:(BOOL)loop doubly:(BOOL)doubly;


///初始化特殊的环链表 start：环开始的地方
- (instancetype)initWithNodeLength:(int)length start:(int)start;


#pragma mark - 链表的操作算法
///打印链表信息
- (void)printNodeList:(struct Node *)head;


///判断链表是否有环 YES存在， NO不存在
- (BOOL)isExistLoop:(struct Node *)head;

///翻转单链表
- (void)reverseSinglyNodeList:(struct Node *)head;

///使用递归的方法逆置(翻转)单链表
- (void)reverseSinglyNodeListWithRecursive:(struct Node *)head nextNode:(struct Node *)next;

@end
