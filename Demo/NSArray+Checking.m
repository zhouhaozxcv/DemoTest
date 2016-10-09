//
//  NSArray+Checking.m
//  Demo
//
//  Created by 梁晨 on 16/10/9.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "NSArray+Checking.h"
#import <objc/runtime.h>

@implementation NSArray (Checking)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method objAtIndex = class_getInstanceMethod(self, @selector(objectAtIndex:));
        Method objAtIndexCheck = class_getInstanceMethod(self, @selector(objAtIndexCheck:));
        
        method_exchangeImplementations(objAtIndex, objAtIndexCheck);
    });
}


- (id)objAtIndexCheck:(NSInteger)index{
    if (self.count <= index) {
        return nil;
    }
    return [self objAtIndexCheck:index];
}

@end
