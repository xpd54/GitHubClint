//
//  EventTableViewController.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventApiCalls.h"
@interface EventTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, EvnetAPIDelegate>
@property (strong, nonatomic) NSArray *eventData;
@property BOOL isFetchingData;
@property UIView *dimViewMask;
@property UIActivityIndicatorView *indicator;
@end
