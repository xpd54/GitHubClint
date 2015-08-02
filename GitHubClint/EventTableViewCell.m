//
//  EventTableViewCell.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell {
    UILabel *userNameLabel;
    UILabel *repoNameLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // Style for "Question Title" Text Label
        CGRect userNameLabelRectangle = CGRectMake(20, -15, 320, 50);
        userNameLabel = [[UILabel alloc] initWithFrame:userNameLabelRectangle];
        userNameLabel.textAlignment = NSTextAlignmentCenter;
        userNameLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:userNameLabel];
        
        CGRect repoNameLabelRectangle = CGRectMake(20, 5, 320, 50);
        repoNameLabel = [[UILabel alloc] initWithFrame:repoNameLabelRectangle];
        repoNameLabel.textAlignment = NSTextAlignmentLeft;
        repoNameLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:repoNameLabel];
        
    }
    return self;
}

- (void) setUserName:(NSString *)userName {
    if(![userName isEqualToString:_userName]) {
        _userName = userName;
        userNameLabel.text = [NSString stringWithFormat:@"User Name :- %@",_userName];
    }
}

- (void) setRepositoryName:(NSString *)repositoryName {
    if (![repositoryName isEqualToString:_repositoryName]) {
        _repositoryName = repositoryName;
        repoNameLabel.text = [NSString stringWithFormat:@"Repository Name :- %@",_repositoryName];
    }
}

@end
