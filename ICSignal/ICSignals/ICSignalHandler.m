//
//  ICSignalHandler.m
//  ICSignal
//
//  Created by _ivanC on 7/2/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import "ICSignalHandler.h"

@interface ICSignalHandler ()

@property (copy, nonatomic) NSString *identifier;
@property (weak, nonatomic) id handler;
@property (strong, nonatomic) NSDictionary * (^ handleBlock)(NSDictionary * );

@end

@implementation ICSignalHandler

+ (instancetype)signalHandlerWithIdentifier:(NSString *)identifier handler:(id)handler handleBlock:(NSDictionary * (^)(NSDictionary * signalInfo))handleBlock
{
    ICSignalHandler *signalHandler = [ICSignalHandler new];
    signalHandler.identifier = identifier;
    signalHandler.handler = handler;
    signalHandler.handleBlock = handleBlock;
    
    return signalHandler;
}

@end
