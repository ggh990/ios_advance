//
//  GangScheduling.h
//  ios_advance
//
//  Created by supertramp on 2019/4/1.
//  Copyright © 2019 chingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.dispatch 调度
 2. queue   队列
 3. sync     同步
 4. async   异步
 5. DISPATCH_QUEUE_CONCURRENT 并发
 6. DISPATCH_QUEUE_SERIAL 串行
 
 使用场景
 在实际开发中，需要开启N个异步线程，但是后续操作，需要依赖N个线程返回的数据，需要接收所有线程任务执行完成的通知。
 
 */


NS_ASSUME_NONNULL_BEGIN

@interface GangScheduling : NSObject

-(void)dispatch_group_demo;

-(void)dispatch_group_async_demo;
@end

NS_ASSUME_NONNULL_END
