//
//  RepoInfoViewController.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoInfoViewController : UIViewController
@property (strong, nonatomic) NSString *repoTitle;
@property (strong, nonatomic) NSNumber *numberOfStar;
@property (strong, nonatomic) NSString *owner;
@property (strong, nonatomic) NSArray *listOfContributors;
@end
