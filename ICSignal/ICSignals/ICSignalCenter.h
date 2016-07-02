//
//  ICSignalCenter.h
//  ICSignal
//
//  Created by _ivanC on 7/1/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICSignalCenter : NSObject

+ (instancetype)defaultCenter;

- (void)registerSignalHandler:(id)handler forSignal:(NSString *)signal handleBlock:(NSDictionary * (^)(NSDictionary * signalInfo))handleBlock;
- (void)unregisterSignalHandler:(id)handler forSignal:(NSString *)signal;

- (void)postSignal:(NSString *)signal withInfo:(NSDictionary *)info responseBlock:(void (^)(id object, NSDictionary *response))responseBlock;

@end
