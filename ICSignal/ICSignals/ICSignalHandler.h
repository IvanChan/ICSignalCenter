//
//  ICSignalHandler.h
//  ICSignal
//
//  Created by _ivanC on 7/2/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICSignalHandler : NSObject

@property (copy, nonatomic, readonly) NSString *identifier;

@property (weak, nonatomic, readonly) id handler;
@property (strong, nonatomic, readonly) NSDictionary * (^ handleBlock)(NSDictionary * );

+ (instancetype)signalHandlerWithIdentifier:(NSString *)identifier handler:(id)handler handleBlock:(NSDictionary * (^)(NSDictionary * signalInfo))handleBlock;

@end
