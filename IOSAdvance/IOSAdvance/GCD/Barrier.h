//
//  Barrier.h
//  ios_advance
//
//  Created by supertramp on 2019/4/1.
//  Copyright © 2019 chingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 
 栅栏函数
 
 <一>什么是dispatch_barrier_async函数
 
 毫无疑问,dispatch_barrier_async函数的作用与barrier的意思相同,在进程管理中起到一个栅栏的作用,它等待所有位于barrier函数之前的操作执行完毕后执行,并且在barrier函数执行之后,barrier函数之后的操作才会得到执行,该函数需要同dispatch_queue_create函数生成的concurrent Dispatch Queue队列一起使用
 
 <二>dispatch_barrier_async函数的作用
 
 1.实现高效率的数据库访问和文件访问
 
 2.避免数据竞争
 
 1.同步栅栏函数dispatch_barrier_sync(dispatch_queue_tqueue,dispatch_block_tblock);特点：
    *栅栏函数会在之前的任务都结束后才开始执行*栅栏函数结束之后才会执行栅栏函数下一行代码，栅栏函数结束之前，下一行代码不会执行（不会把后面的任务添加到队列中，只有等到栅栏函数结束后，才会把任务添加到队列中并执行任务）
 2.异步栅栏函数dispatch_barrier_async(dispatch_queue_tqueue,dispatch_block_tblock);特点：
    *栅栏函数会在之前的任务都结束后才会执行*栅栏函数结束之后才会才会执行栅栏函数后面的任务，栅栏函数结束之前，后面的任务代码依然执行，只是把任务添加到队列中，但不会执行任务，只有等栅栏函数结束后才会执行任务
 

 */

@interface Barrier : NSObject


-(void)barrier_demo;

@end

NS_ASSUME_NONNULL_END
