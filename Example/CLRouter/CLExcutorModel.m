//
//  CLExcutorModel.m
//  CFPicGame
//
//  Created by chen on 2018/10/10.
//  Copyright © 2018年 chen. All rights reserved.
//

#import "CLExcutorModel.h"
#import "CLRouter.h"
@interface CLExcutorModel()<CLRouterActionDelegate>

@end

@implementation CLExcutorModel

- (void)routerSetParam:(CLRParamModelBase *)param block:(CLRouterBlock)block
{
    Class nextClass = NSClassFromString(@"CFNextViewController");
    UIViewController* nextVC = (UIViewController *)[[nextClass alloc]init];
    
    if (param.object) {
        NSDictionary *paramDict = param.object;
        for (NSString *key in paramDict.allKeys) {
            [nextVC setValue:paramDict[key] forKey:key];
        }
    }
    
    UINavigationController *navVC = [[CLRouter shareInstance]getCurrentNavigationController];
    
    [navVC pushViewController:nextVC animated:YES];
}

@end
