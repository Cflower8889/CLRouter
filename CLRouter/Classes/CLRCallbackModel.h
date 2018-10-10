//
//  CLRCallbackModel.h
//  CFPicGame
//
//  Created by chen on 2018/10/10.
//  Copyright © 2018年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLRCallbackModel : NSObject

//回调的结果是继承 NSObject 对象
@property (nonatomic, strong) NSObject *object;

@property (nonatomic, copy  ) NSString *errorMessage;
@end

NS_ASSUME_NONNULL_END
