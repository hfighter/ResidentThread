//
//  ResidentThread.h
//  PermenertThread
//
//  Created by huihong on 2017/9/4.
//  Copyright © 2017年 huihong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResidentThread : NSObject

@property (nonatomic, strong, readonly) NSThread *residentThread;

+ (instancetype)sharedInstance;

@end
