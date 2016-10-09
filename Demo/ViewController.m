//
//  ViewController.m
//  Demo
//
//  Created by lc on 16/8/15.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "NSObject+Calculate.h"
#import "CeShiView.h"
//#include "Sorts.hpp"
#import "SortsManager.h"
#import "CeshiString.h"
#import "NodeManager.h"
#import "TransformManager.h"
#import "ListViewController.h"



@interface ViewController (){
    UIView *view;
    
    NSString *address;
    
    UITextField *_textField;
}



@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _scr.backgroundColor = [UIColor redColor];
//    _img.backgroundColor = [UIColor greenColor];
//    
//    NSLog(@"_scr = %@",NSStringFromCGRect(_scr.frame));
//    NSLog(@"_img = %@",NSStringFromCGRect(_img.frame));

//    ViewModel *vm= [[ViewModel alloc] init];
//    vm.name = @"zhouhao";
//    vm.age = 20;
//    vm.address = @"zh";
//
//    ViewA *a = [[ViewA alloc] init];
//    [a setFrame:CGRectMake(0, 0, 100, 100)];
//    [a setViewDataWithClassName:NSStringFromClass([vm class])];
//    [self.view addSubview:a];
//    
//    
//    
//    NSString *plist = objc_getAssociatedObject(a, @"asdf");
//    NSLog(@"%@",plist);
    
    
    
    
    
    NSInteger result = [NSObject makeCalculate:^(CalculateMaker *make) {
        make.add(1).add(2).add(10);
//        make.muilt(10);
        
    }];
    NSLog(@"%ld",(long)result);
    

    
//    AAA *a = [[AAA alloc] init];
//    Sorts sort = *new Sorts();
//    sort.StringToInt("-123");

//    int ar[10] = {2,3,5,1,4,6,53,56,123,76};
//    sort.sortWithStraightInsertionSort(ar, 10);
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.tag = 0;
    [btn addTarget:self action:@selector(bbbbb:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor yellowColor];
    btn.tag = 1;
    [btn addTarget:self action:@selector(bbbbb:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    [btn setBounds:CGRectMake(10, 10, 50, 50)];

    
    
    [self getMaxSum:@[@(-1),@1,@(-100),@1000,@-1,@2,@3,@(-10),@(-2000),@3,@4,@10,@(-21)]];
    
    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    
//    
//    __block NSInteger j = 0;
//    NSMutableArray *conditions = [[NSMutableArray alloc] init];
//    
//    for (NSInteger i = 0; i < 1000; i++) {
//        NSConditionLock *lock = [[NSConditionLock alloc] initWithCondition:i];
//        lock.name = [NSString stringWithFormat:@"The  %ld  Thread cread",i];
//        [conditions addObject:lock];
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            NSLog(@"第%ld个线程开始执行",(long)i);
//            NSInteger ram = random()%100;
//            NSInteger result = 0;
//            
//            for (NSInteger j = 0; j < ram; j++) {
//                result += j;
//            }
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
////                NSLog(@"%@",conditions);
//                NSLog(@"%@",lock);
//                [lock lockWhenCondition:j];
//                NSLog(@"第%ld个线程完成，result = %ld",(long)j,(long)result);
//                NSLog(@"lock.condition = %ld",lock.condition);
//                
////                while (![lock tryLockWhenCondition:j+1]) {
////                    NSLog(@"暂时还不可以已让第%ld个线程开始",j+1);
////                }
//                j++;
//                [lock unlockWithCondition:j+1];
//                
//            });
//            
//            
//        });
//    }
    
    
    
    
    
    
    
    
//    __block int b = 0;
//    static int c = 10;
//    void (^blk)(int) = ^(int a){
//        b = 10;
//        c = 100;
//        printf("%d  %d",b,c);
//
//    };
//    
//    blk(1);
    
//    CeshiString *string = [[CeshiString alloc] init];
////    __unsafe_unretained CeshiString *aa = string;
//    NSLog(@"p = %p  p1=%p   D=%zu  %lu",&string,string,class_getInstanceSize(object_getClass(string)),(unsigned long)string.retainCount);
//    
////    CFArrayRef sf = (__bridge_retained CFArrayRef)string;
////    CFRelease(sf);
//    [string release];
////    string = nil;
//    
//    NSLog(@"p = %p  p1=%p   D=%zu",&string,string,class_getInstanceSize(object_getClass(string)));
//    
//    NSString *str1 = [[NSString alloc] initWithFormat:@"aa"];
//    NSLog(@"%ld",(long)[str1 retainCount]);
//    str1 = @"bb";
//    NSLog(@"%ld %ld",(long)[str1 retainCount],NSIntegerMax);
//    NSMutableString *str2 = [[NSMutableString alloc] initWithFormat:@"cc"];
//    [str2 setString:@"ddd"];
//    
//    NSLog(@"end");
//    
//    
//    
//    self.name = @"aa";
//    address = @"ww";
    
//    Method objAtIndex = class_getInstanceMethod(self.class, @selector(aa));
//    Method objAtIndexCheck = class_getInstanceMethod(self.class, @selector(bb));
//    
//    method_exchangeImplementations(objAtIndex, objAtIndexCheck);
//    
//    [self aa];
//    [self bb];
    
//    SEL sel = @selector(aa);
    class_addMethod(btn.class, @selector(sayHello), (IMP)sayHello, "v@:");
    [btn sayHello];
}


//- (void)aa{
//    NSLog(@"%s",__FUNCTION__);
//}

void sayHello(id self, SEL _cmd)
{ NSLog(@"Hello"); }

- (void)bb{
    NSLog(@"%s",__FUNCTION__);
}


- (void)bbbbb:(UIButton *)btn{
//    NSArray *array = @[@666,@8,@6,@676,@432,@2,@4,@123,@6549,@465489,@321,@4,@9,@21,@98,@89,@78,@87,@654,@98745,@65975,@12345,@23456,@45678,@568912,@147,@258,@369,@741,@852,@963];
//    [SortsManager sortWithQuick:[array mutableCopy] low:0 high:array.count-1];
//    NSInteger *age = 11;
//    BOOL *stop = YES;
    
//    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"idx=%lu, id=%@", (unsigned long)idx, obj);
//        
//        if (idx == 15) {
//            *stop = YES;
//        }
//        
//    }];
    
//    SortsManager *sort = [[SortsManager alloc] init];
//    sort.blocka = ^(NSString *a){
//        self.name = @"dd";
//        *age = 22;
////        *stop = NO;
//        address = @"ee";
//        NSLog(@"%@   %@  %ld" ,self.name,address,(long)*age);
//    };
//    
//    [sort ggg];
//    
//    [SortsManager ceshiBlock:^(id a) {
//       self.name = @"bb";
////        age = @"22";
//        address = @"qq";
//        NSLog(@"%@   %@" ,self.name,address);
//    }];
//    
//    void(^bbbbbc)(int) = ^(int b){
//        self.name = @"ccc";
//        NSLog(@"%@",self.name);
//    };
//    
//    bbbbbc(2);
    
    


    
    
    

    ListViewController *source = [[ListViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:source];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)getMaxSum:(NSArray *)a{
    int curSum = 0;//当前值
    int maxSum = [a[0] intValue];//最大和
    int start = 0;//开始位置
    int end = 0;//结束位置
    int tempStart = 0;//中间变量，记录开始位置
    
    for (int i = 0; i < a.count; i++) {
        if (curSum == 0)
            tempStart = i;
        
        curSum += [a[i] intValue];
        
        if (curSum > maxSum) {
            maxSum = curSum;
            end = i;
            start = maxSum < 0 ? end : tempStart;
        }
        
        if (curSum < 0)
            curSum = 0;
        
    }
    NSLog(@"total:%d , start:%d , end:%d",maxSum,start,end);
}

- (void)aaa{
    //并行队列同步
    dispatch_queue_t queue = dispatch_queue_create("zhouhao", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序1",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序2",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序3",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序4",[NSThread currentThread]);
    });
}

- (void)bbb{
    //并行队列异步
    dispatch_queue_t queue = dispatch_queue_create("zhouhao", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序1",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序2",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序3",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"当前线程 = %@ -- 执行循序4",[NSThread currentThread]);
    });
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

