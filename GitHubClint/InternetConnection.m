//
//  InternetConnection.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "InternetConnection.h"
#import "Reachability.h"
@implementation InternetConnection
+(BOOL) isInternetConnectionAvailable {
    Reachability *network = [Reachability reachabilityWithHostName:@"api.github.com"];
    NetworkStatus netStatus = [network currentReachabilityStatus];
    if (netStatus == NotReachable) {
        return NO;
    }
    return YES;
}
@end
