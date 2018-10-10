//
//  CLRouter.h
//  CFPicGame
//
//  Created by chen on 2018/10/10.
//  Copyright © 2018年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLRParamModelBase.h"
@class CLRCallbackModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^CLRouterBlock)(CLRCallbackModel *result);

/**
 路由执行方法协议
 */
@protocol CLRouterActionDelegate <NSObject>


/**
 *  @param param 对应功能规定的参数，继承基类TNRParamModelBase
 *  @param block 功能回调参数
 */
-(void)routerSetParam:(CLRParamModelBase*)param block:(CLRouterBlock)block;

@end

@interface CLRouter : NSObject

+ (instancetype)shareInstance;


/**
 路由原生跳转 **模块解耦**

 @param routerName 路由名称
 @param path 协议名称
 @param paramDict 参数
 @param block 回调
 */
- (void)startModuleRouterName:(NSString *)routerName
                         path:(NSString *)path
                    paramDict:(NSDictionary *)paramDict
                        block:(CLRouterBlock)block;

- (UINavigationController *)getCurrentNavigationController;

@end

NS_ASSUME_NONNULL_END
