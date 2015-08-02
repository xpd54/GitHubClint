//
//  EventApiCalls.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@protocol EvnetAPIDelegate <NSObject>
- (void) fetchEventSuccess:(NSArray *)eventArray;
@end
@interface EventApiCalls : NSObject
@property (weak, nonatomic) id <EvnetAPIDelegate> eventDelegate;

- (id) init;
+ (EventApiCalls *) sharedInstance;
- (void) getDataFromUrlString:(NSString *)url
             withSuccessBlock:(SuccessBlock)success
              andFailureBlock:(FailureBlock)failure;
@end
