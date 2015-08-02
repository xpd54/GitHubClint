//
//  Strings.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#ifndef GitHubClint_Strings_h
#define GitHubClint_Strings_h
typedef void (^SuccessBlock)(id jsonResp);
typedef void (^FailureBlock)(void);
#define DISPATCH_QUEUE_FETCH_EVENT "com.githubclint.event"
#define API_URL_STRING @"https://api.github.com/events"
#define GET @"GET"

#define ACTOR @"actor"
#define LOGIN @"login"

#define REPO @"repo"
#define REPO_NAME @"name"
#define REPO_URL @"url"

#define USERNAME @"username"
#define REPOSITORY_NAME @"repositoryname"
#endif
