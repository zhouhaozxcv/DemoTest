//
//  ZHOperation.m
//  DefineTest
//
//  Created by 超级犀牛 on 2017/10/30.
//  Copyright © 2017年 超级犀牛. All rights reserved.
//

#import "ZHOperation.h"
#import "ZHOperationQueue.h"

static NSString *Letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@interface ZHOperation()

@end


@implementation ZHOperation
@synthesize operationId = _operationId, autoRunWhenDependencyOperationFinished=_autoRunWhenDependencyOperationFinished;

- (instancetype)init {
    self = [super init];
    if (self) {
        _operationId = [self getOperationId];
        
    }
    return self;
}

- (ZHOperation *)execute:(void(^)(id x))execute{
    self.executeBlock = execute;
    return self;
}

//- (ZHOperation *)addDependency:(ZHOperation *)operation autoRun:(BOOL)run{
//    NSAssert(operation==nil, @"Dependency operation is nil");
//    if (operation) {
//        _dependencyOperation = operation;
//        _autoRunWhenDependencyOperationFinished = run;
//        return self;
//    }else{
//        return nil;
//    }
//}


- (void)dispose{
    [[ZHOperationQueue currentQueue] endOperatingToNext];
}


- (NSString *)getOperationId{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSInteger len = 4;
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (NSInteger i = 0; i < len; i++) {
        NSInteger randomNumber = arc4random()%[Letters length];
        [randomString appendFormat:@"%C",[Letters characterAtIndex:randomNumber]];
    }
    NSString *temp = [NSString stringWithFormat:@"%.f%@",timestamp,randomString];
    return temp;
}

//- (NSString *) md5:(NSString *) input {
//    const char *cStr = [input UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
//
//    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//
//    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//
//    return  output;
//}

- (NSString *)operationId{
    return _operationId;
}

@end
