//
//  JsonParser.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject
+ (NSArray *) getListOfEvents:(NSArray *)eventArray;
+ (NSDictionary *) getRepoInformation:(NSDictionary *)repoDict;
+ (NSArray *) getContributors:(NSArray *)contributors;
@end
