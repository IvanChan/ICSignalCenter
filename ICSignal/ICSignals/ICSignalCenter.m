//
//  ICSignalCenter.m
//  ICSignal
//
//  Created by _ivanC on 7/1/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import "ICSignalCenter.h"
#import "ICSignalHandler.h"

@interface ICSignalCenter ()

@property (strong, nonatomic) NSMutableDictionary *signalHandlers;

@end

@implementation ICSignalCenter

#pragma mark - Lifecycle
+ (instancetype)defaultCenter
{
    static ICSignalCenter *s_instance = nil;
    
    if (s_instance == nil)
    {
        @synchronized(self)
        {
            s_instance = [[self alloc] init];
        }
    }
    
    return s_instance;
}

#pragma mark - Getters
- (NSMutableDictionary *)signalHandlers
{
    if (_signalHandlers == nil)
    {
        _signalHandlers = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    return _signalHandlers;
}

#pragma mark - Public
- (void)registerSignalHandler:(id)handler forSignal:(NSString *)signal handleBlock:(NSDictionary * (^)(NSDictionary * signalInfo))handleBlock
{
    if ([signal length] <= 0 || handler == nil || handleBlock == nil || self.signalHandlers[signal] != nil)
    {
        assert(0);
        return;
    }
    
    @synchronized (self) {
        
        ICSignalHandler *handlerWrap = [ICSignalHandler signalHandlerWithIdentifier:signal handler:handler handleBlock:handleBlock];
        self.signalHandlers[signal] = handlerWrap;
    }
}

- (void)unregisterSignalHandler:(id)handler forSignal:(NSString *)signal
{
    if ([signal length] <= 0 || handler == nil )
    {
        assert(0);
        return;
    }
    
    @synchronized (self) {

        [self.signalHandlers removeObjectForKey:signal];
    }
}

- (void)postSignal:(NSString *)signal withInfo:(NSDictionary *)info responseBlock:(void (^)(id object, NSDictionary *response))responseBlock
{
    if ([signal length] <= 0 || responseBlock == nil)
    {
        assert(0);
        return;
    }
    
    @synchronized (self) {
        
        NSMutableArray *toRemoveHandlerKeys = [NSMutableArray arrayWithCapacity:3];
        [self.signalHandlers enumerateKeysAndObjectsUsingBlock:^(NSString *key, ICSignalHandler *handlerWrap, BOOL *stop) {
           
            if (handlerWrap.handler == nil)
            {
                [toRemoveHandlerKeys addObject:handlerWrap.identifier];
            }
            else
            {
                if ([signal isEqualToString:key])
                {
                    responseBlock(handlerWrap.handler, handlerWrap.handleBlock(info));
                    *stop = YES;
                }
            }
        }];
        
        if ([toRemoveHandlerKeys count] > 0)
        {
            [self.signalHandlers removeObjectsForKeys:toRemoveHandlerKeys];
        }
    }
}

@end
