//
//  GangScheduling.m
//  ios_advance
//
//  Created by supertramp on 2019/4/1.
//  Copyright © 2019 chingsoft. All rights reserved.
//

#import "GangScheduling.h"

@implementation GangScheduling

/*
 结果 ：
 2016-09-13 13:50:23.992 12-调度组[2598:1484594] 任务2
 2016-09-13 13:50:23.992 12-调度组[2598:1484584] 任务1
 2016-09-13 13:50:25.993 12-调度组[2598:1484590] 任务3
 2016-09-13 13:50:25.993 12-调度组[2598:1484334] hello
 2016-09-13 13:50:25.999 12-调度组[2598:1484334] over
 */

-(void)dispatch_group_demo
{
    //创建组
    dispatch_group_t group = dispatch_group_create();
    //创建队列
    dispatch_queue_t queue = dispatch_queue_create("qr", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        NSLog(@"任务1");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        NSLog(@"任务2");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
      //  [NSThread sleepForTimeInterval:2.0];
        NSLog(@"任务3");
        dispatch_group_leave(group);
    });
    
    //等待组中的任务都执行完毕，才会执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"主线程回来了");
    });
    
    //等待组中的任务都执行完毕，才会继续执行后续的代码
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"HELLO WORD");
    
    
    /*
     注：dispatch_group_notify这个函数是异步的，如果要换成同步用dispatch_group_wait(group, DISPATCH_TIME_FOREVER).群组不空，这句代码一直等，下面代码不执行
     */
    
}

/*
 2016-09-13 13:56:18.718 12-调度组[2625:1529382] 正在下载第一个歌曲
 2016-09-13 13:56:18.718 12-调度组[2625:1529377] 正在下载第二个歌曲
 2016-09-13 13:56:18.718 12-调度组[2625:1529384] 正在下载第三个歌曲
 2016-09-13 13:56:20.724 12-调度组[2625:1529302] over <NSThread: 0x7f9d63e03f30>{number = 1, name = main}
 */
-(void)dispatch_group_async_demo
{
    //创建组
    dispatch_group_t group = dispatch_group_create();
    //队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载第一首歌曲");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载第二首歌曲");
      //  [NSThread sleepForTimeInterval:2.0];
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载第三首歌曲");
    });
    
    //当三个异步任务都执行完成，才执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"over %@",[NSThread currentThread]);
    });
}

@end
