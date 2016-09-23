//
//  UIView+Copy.m
//  Demo
//
//  Created by 梁晨 on 16/9/6.
//  Copyright © 2016年 lc. All rights reserved.
//

#import "UIView+Copy.h"

@implementation UIView (Copy)

- (id)copyWithZone:(NSZone *)zone{
    if (self) {
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}

@end
