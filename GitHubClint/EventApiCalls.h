//
//  EventApiCalls.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface EventApiCalls : NSObject

- (id) init;
+ (EventApiCalls *) sharedInstance;
- (void) getDataFromUrlString:(NSString *)url
             withSuccessBlock:(SuccessBlock)success
              andFailureBlock:(FailureBlock)failure;
@end
