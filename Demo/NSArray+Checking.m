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
        Class class = object_getClass((id)self);//[self class];
        Method objAtIndex = class_getInstanceMethod(class, @selector(objectAtIndex:));
        Method objAtIndexCheck = class_getInstanceMethod(class, @selector(objAtIndexCheck:));
        
        BOOL didAddMethod = class_addMethod(class, @selector(objAtIndexCheck:), method_getImplementation(objAtIndexCheck), method_getTypeEncoding(objAtIndexCheck));
        
        if (didAddMethod) {
            class_replaceMethod(class, @selector(objAtIndexCheck:), method_getImplementation(objAtIndex), method_getTypeEncoding(objAtIndex));
        } else {
            method_exchangeImplementations(objAtIndex, objAtIndexCheck);
        }
    });
}


- (id)objAtIndexCheck:(NSInteger)index{
    if (self.count <= index) {
        return nil;
    }
    return [self objAtIndexCheck:index];
}

@end
