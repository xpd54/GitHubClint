//
//  EventApiCalls.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "EventApiCalls.h"
#import "InternetConnection.h"

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

- (void) getDataFromUrlString:(NSString *)url
             withSuccessBlock:(SuccessBlock)success
              andFailureBlock:(FailureBlock)failure {

    dispatch_queue_t fetchEvent = dispatch_queue_create(DISPATCH_QUEUE_FETCH_EVENT, nil);
    dispatch_async(fetchEvent, ^{
        if ([InternetConnection isInternetConnectionAvailable]) {
            NSData *responseData = [self makeApiCallForUrlString:url];
            if (responseData) {
                NSArray *eventArray = [NSJSONSerialization JSONObjectWithData:responseData
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:nil];
                if (success) {
                    success(eventArray);
                }
            } else {
                if (failure) {
                    failure();
                }
            }
        } else {
            if (failure) {
                failure();
            }
        }
    });
}

- (NSData *) makeApiCallForUrlString:(NSString *)url {
    NSError *error;
    NSHTTPURLResponse *response;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:API_URL_STRING]];
    [request setHTTPMethod:GET];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (responseData &&[response statusCode] == 200) {
        NSLog(@"Fetch event success");
    } else {
        NSLog(@"Fetch event fail with status code %ld",[response statusCode]);
    }
    return responseData;
}

@end
