//
//  EventApiCalls.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "EventApiCalls.h"

@implementation EventApiCalls

- (id) init {
    self = [super init];
    if(self) {
    }
    return self;
}

+ (EventApiCalls *) sharedInstance {
    static dispatch_once_t once;
    static EventApiCalls *instance;

    dispatch_once(&once, ^{
                      instance = [self new];
                  });
    
    return instance;
}

- (void) fetchEvent {
    [self.eventDelegate fetchEventSuccess:@[@"test"]];
}

@end
