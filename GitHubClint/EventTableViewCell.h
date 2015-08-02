//
//  EventTableViewCell.h
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell
@property (strong, nonatomic) NSString *repositoryName;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *userName;
@end
