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

+ (NSDictionary *) getRepoInformation:(NSDictionary *)repoDict {
    NSMutableDictionary *repoInfo = [[NSMutableDictionary alloc] init];
    if ([repoDict objectForKey:REPO_NAME]) {
        [repoInfo setObject:[repoDict objectForKey:REPO_NAME] forKey:REPO_NAME];
        if ([[repoDict objectForKey:OWNER] objectForKey:OWNER_HTML_URL]) {
            [repoInfo setObject:[[repoDict objectForKey:OWNER] objectForKey:OWNER_HTML_URL] forKey:OWNER_HTML_URL];
        }

        if ([[repoDict objectForKey:OWNER] objectForKey:LOGIN]) {
            [repoInfo setObject:[[repoDict objectForKey:OWNER] objectForKey:LOGIN] forKey:LOGIN];
        }

        if ([repoDict objectForKey:CONTRIBUTORS_URL]) {
            [repoInfo setObject:[repoDict objectForKey:CONTRIBUTORS_URL] forKey:CONTRIBUTORS_URL];
        }

        if ([repoDict objectForKey:STAR_COUNT]) {
            [repoInfo setObject:[repoDict objectForKey:STAR_COUNT] forKey:STAR_COUNT];
        }
        
    }
    return repoInfo;
}
@end
