//
//  ContributorsTableViewController.h
//  GitHubClint
//
//  Created by y10uc256 on 8/3/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContributorsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *contributorsList;
@property (strong, nonatomic) NSString *contributorsUrl;
@property UIView *dimViewMask;
@property UIActivityIndicatorView *indicator;
@end
