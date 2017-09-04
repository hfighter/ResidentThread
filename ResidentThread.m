//
//  ResidentThread.m
//  PermenertThread
//
//  Created by huihong on 2017/9/4.
//  Copyright © 2017年 huihong. All rights reserved.
//

#import "ResidentThread.h"

@interface ResidentThread ()
@property (nonatomic, strong, readwrite) NSThread *residentThread;
@end

@implementation ResidentThread

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createResidentThread];
    }
    return self;
}

#pragma mark - public methods

+ (instancetype)sharedInstance {
    static ResidentThread *thread = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thread = [[ResidentThread alloc] init];
    });
    return thread;
}

#pragma mark - private methods

- (void)createResidentThread {
    self.residentThread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    self.residentThread.name = @"Resident_Thread";
    [self.residentThread start];
}

- (void)run {
    // 输入源
    // [self runloopSource];
    // 定时器
    [self runloopTimer];
}

- (void)runloopSource {
    @autoreleasepool {
        [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)runloopTimer {
    @autoreleasepool {
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(events) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)events {
}

@end
