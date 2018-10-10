//
//  CLRouter.m
//  CFPicGame
//
//  Created by chen on 2018/10/10.
//  Copyright © 2018年 chen. All rights reserved.
//

#import "CLRouter.h"

@implementation CLRouter

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static CLRouter *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    
    return instance;
}

- (void)startModuleRouterName:(NSString *)routerName path:(NSString *)path paramDict:(NSDictionary *)paramDict block:(CLRouterBlock)block
{
    if (![self judgeRouterName:routerName andPath:path]) {
        return;
    }
    
    NSString *routerPath = [[NSBundle mainBundle]pathForResource:routerName ofType:@"plist"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:routerPath]) {
        NSLog(@"协议不存在");
        return;
    }
    
    NSDictionary *routerDict = [[NSDictionary alloc]initWithContentsOfFile:routerPath];
    
    NSDictionary *routerPathDict = [routerDict objectForKey:path];
    
    if ([routerPathDict objectForKey:@"excutor"]) {
        //有执行
        NSString *excutor = [routerPathDict objectForKey:@"excutor"];
        Class excutorClass = NSClassFromString(excutor);
        
        id excutorModel = [excutorClass new];
        
        CLRParamModelBase *param = [CLRParamModelBase new];
        param.object    = paramDict;
        
        [excutorModel routerSetParam:param block:block];
    }
}

- (BOOL)judgeRouterName:(NSString *)routerName andPath:(NSString *)path
{
    BOOL isOk = YES;
    if (!routerName||!path) {
        NSLog(@"路由协议为空");
        isOk = NO;
    }
    
    if (![routerName isKindOfClass:NSString.class]||![path isKindOfClass:NSString.class]) {
        NSLog(@"路由协议名称传参错误");
        isOk = NO;
    }
    
    if (routerName.length == 0 || path.length == 0) {
        NSLog(@"路由协议名称不能为空");
        isOk = NO;
    }
    
    return isOk;
}

- (UINavigationController *)getCurrentNavigationController
{
    UINavigationController *nav = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([nav isKindOfClass:UINavigationController.class]) {
        return nav;
    }
    
    return nil;
}
@end
