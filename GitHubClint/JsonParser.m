//
//  JsonParser.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "JsonParser.h"
#import "Constants.h"

@implementation JsonParser
+ (NSArray *) getListOfEvents:(NSArray *)eventArray {
    NSMutableArray *eventData = [[NSMutableArray alloc] init];
    for (NSDictionary *user in eventArray) {
        if ([[user objectForKey:ACTOR] objectForKey:LOGIN]) {
            NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
            [event setObject:[[user objectForKey:ACTOR] objectForKey:LOGIN] forKey:USERNAME];
            
            if ([[user objectForKey:REPO] objectForKey:REPO_NAME]) {
                [event setObject:[[user objectForKey:REPO] objectForKey:REPO_NAME] forKey:REPOSITORY_NAME];
                [event setObject:[[user objectForKey:REPO] objectForKey:REPO_URL] forKey:REPO_URL];
            }
            [eventData addObject:event];
        }
    }
    return eventData;
}
@end
