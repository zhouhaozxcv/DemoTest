//
//  NodeManager.m
//  Demo
//
//  Created by 梁晨 on 16/9/23.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "NodeManager.h"

@implementation NodeManager

@synthesize loopNodeList = _loopNodeList, doublyNodeList = _doublyNodeList, loopStart =_loopStart;

- (instancetype)initWithNodeLength:(int)length
{
    self = [super init];
    if (self) {
        if (length >0) {
            _loopStart = -1;
            [self createNodeList:length loop:NO doubly:NO];
            
        }
    }
    return self;
}

- (instancetype)initWithNodeLength:(int)length loop:(BOOL)loop doubly:(BOOL)doubly{
    self = [super init];
    if (self) {
        if (length >0) {
            _loopStart = (loop == YES) ? 0 : -1;
            [self createNodeList:length loop:loop doubly:doubly];
            
        }
    }
    return self;
}

- (instancetype)initWithNodeLength:(int)length start:(int)start{
    self = [super init];
    if (self) {
        if (length >0) {
            _loopStart = start;
            [self createNodeList:length loop:YES doubly:NO];
            
        }
    }
    return self;
}

- (void)createNodeList:(int)length loop:(BOOL)loop doubly:(BOOL)doubly{
    _loopNodeList = loop;
    _doublyNodeList = doubly;
    
    
    struct Node *p1, *p2 = NULL;//p1正常的创建链表用，p2特殊环存在时用
    
    self.head = malloc(sizeof(struct Node));//利用 malloc() 函数向系统申请分配一个节点
    self.head->data = -1;//设置头信息
    self.head->next = NULL;
    self.head->previous = NULL;
    
    
    p1 = self.head;
    
    for (int i = 0; i < length; i++) {
        
        struct Node *new = malloc(sizeof(struct Node));
        new->data = i;
        new->next = NULL;
        if (doubly) {
            new->previous = p1;
        }else{
            new->previous = NULL;
        }
        
        
        p1->next = new;
        p1 = new;
        
        if (_loopStart == i && _loopStart >= 1) {
            p2 = p1;
        }
    }
    
    if (loop) {
        if (_loopStart == 0) {
            p1->next = self.head;
            if (doubly) {
                self.head->previous = p1;
            }
        }else{
            p1->next = p2;
            NSLog(@"环开始的位置：%d",p2->data);
            if (doubly) {
                p2->previous = p1;
            }
        }
    }
}

- (BOOL)isLoopNodeList{
    return _loopNodeList;
}

- (BOOL)isDoublyNodeList{
    return _doublyNodeList;
}


- (void)printNodeList:(struct Node *)head{
    printf("头指针：%d \n",head->data);
    if (!_loopNodeList) {
        struct Node *temp;
        temp = head->next;
        
        while (temp != NULL) {
            printf("结点信息 ：%d \n",temp->data);
            temp = temp->next;
        }
    }else{
        NSLog(@"循环链表，不打印");
    }
}

- (BOOL)isExistLoop:(struct Node *)head{
    struct Node *fast, *slow;
    fast = slow = head;
    
    if (fast != NULL && slow != NULL) {
        fast = fast->next->next;
        slow = slow->next;
    }
    
    while (fast->next != NULL && fast != NULL) {
        if (fast == slow) {
            return YES;
        }else{
            fast = fast->next->next;
            slow = slow->next;
        }
    }
    
    
    return NO;
}

- (int)loopLength{
    if (self.head != NULL) {
        if ([self isExistLoop:self.head]) {
            int begin = 0, again = 0, length = 0;
            struct Node *fast, *slow;
            fast = self.head->next->next;
            slow = self.head->next;
            
            while (YES) {
                fast = fast->next->next;
                slow = slow->next;
                
                if (fast == slow && again == 1) {
                    NSLog(@"碰面了：%d",fast->data);
                    break;
                }
                
                if (fast == slow && again == 0) {
                    begin = 1;
                    again = 1;
                }
                
                if (begin == 1) {
                    ++length;
                }
            }
            
            return length;
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

- (int)loopStart{
    
    if (self.head != NULL) {
        struct Node *fast, *slow;
        fast = slow = self.head;
        while (fast != NULL && fast->next->next != NULL && fast->next != NULL) {
            fast = fast->next->next;
            slow = slow->next;
            if (fast == slow) {
                break;
            }
        }
        
        slow = self.head;
        
        while (slow != fast) {
            slow = slow->next;
            fast = fast->next;
        }
        _loopStart = fast->data;
        return _loopStart;
        
    }else{
        return 0;
    }
}

/*
 链表：head->1->2->3->4->5->null
 ①：
 */

- (void)reverseSinglyNodeList:(struct Node *)head{
    struct Node *p1, *p2;
    p1 = head->next;
    p2 = head->next->next;
    
    
    while (p2 != NULL) {
        head->next->next = p2->next;
        p2->next = p1;
        p1 = p2;
        p2 = head->next->next;
    }
    
    self.head->next = p1;
}

/* 例：head->1->2->3->4->5->null
 使用栈的思想
 */

- (void)reverseSinglyNodeListWithRecursive:(struct Node *)head nextNode:(struct Node *)next{
    if(next->next == NULL)
    {
        head->next=next;//这一步之后链表会形成：1->2->3->4->5<-head
        return;//找到最后一个节点
    }
    [self reverseSinglyNodeListWithRecursive:head nextNode:next->next];
    next->next->next=next;//反转节点，这时候对于最后两个节点来说是个环，1->2->3->4<->5<-head(4和5形成环)
    next->next=NULL;//第一个节点反转后其后继应该为NULL，断开4指向5的next，1->2->3->4<-5<-head   然后依次类推
    
}

@end
