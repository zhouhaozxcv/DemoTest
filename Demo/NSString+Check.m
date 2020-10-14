//
//  NSString+Check.m
//  Demo
//
//  Created by 梁晨 on 16/10/10.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "NSString+Check.h"
#import <objc/runtime.h>

@implementation NSString (Check)

+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = NSClassFromString(@"__NSCFConstantString");
//        Method objAtIndex = class_getInstanceMethod(class, @selector(isEqualToString:));
//        Method objAtIndexCheck = class_getInstanceMethod(class, @selector(isEqualToStringCheck:));
//        
//        BOOL didAddMethod = class_addMethod([self class], @selector(isEqualToStringCheck:), method_getImplementation(objAtIndexCheck), method_getTypeEncoding(objAtIndexCheck));
//        
//        if (didAddMethod) {
//            class_replaceMethod([self class], @selector(isEqualToStringCheck:), method_getImplementation(objAtIndex), method_getTypeEncoding(objAtIndex));
//        } else {
//            method_exchangeImplementations(objAtIndex, objAtIndexCheck);
//        }
//    });
}


- (BOOL)isEqualToStringCheck:(NSString *)aString{
    NSLog(@"aaa = %@",aString);
    return [self isEqualToStringCheck:aString];
}

@end
