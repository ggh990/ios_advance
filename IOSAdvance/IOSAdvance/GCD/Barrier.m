//
//  Barrier.m
//  ios_advance
//
//  Created by supertramp on 2019/4/1.
//  Copyright © 2019 chingsoft. All rights reserved.
//

#import "Barrier.h"

@implementation Barrier
-(void)barrier_demo
{
  //同dispatch_queue_create函数生成的concurrent Dispatch Queue队列一起使用
    dispatch_queue_t queue = dispatch_queue_create("qgh", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"----1--------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"----2------%@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"----barrier-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"----3--------%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"----4--------%@",[NSThread currentThread]);
    });
}
@end
