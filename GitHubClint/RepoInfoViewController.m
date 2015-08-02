//
//  RepoInfoViewController.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "RepoInfoViewController.h"
#import "EventApiCalls.h"
#import "JsonParser.h"
#import "ContributorsTableViewController.h"
@implementation RepoInfoViewController

- (void) loadView {
    [super loadView];
    [self setTitle:self.ownerLogin];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGFloat width = self.view.bounds.size.width;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, width, 50)];
    [title setBackgroundColor:[UIColor lightGrayColor]];
    title.text = [NSString stringWithFormat:@"Repo title :-  %@",self.repoTitle];
    [title setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:title];
    
    UILabel *numberOfStar = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, width, 50)];
    [numberOfStar setBackgroundColor:[UIColor lightGrayColor]];
    numberOfStar.text = [NSString stringWithFormat:@"Number of ✩ :- %@",self.numberOfStar];
    [numberOfStar setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:numberOfStar];
    
    UIButton *ownerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 180, width, 50)];
    [ownerButton addTarget:self action:@selector(showOwnerPage) forControlEvents:UIControlEventTouchDown];
    [ownerButton setBackgroundColor:[UIColor lightGrayColor]];
    [ownerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ownerButton setTitle:[NSString stringWithFormat:@"Owner Login :- %@",self.ownerLogin] forState:UIControlStateNormal];
    [ownerButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:ownerButton];
    
    UIButton *contributors = [[UIButton alloc] initWithFrame:CGRectMake(0, 240, width, 50)];
    [contributors addTarget:self action:@selector(showCotributorsPage) forControlEvents:UIControlEventTouchDown];
    [contributors setBackgroundColor:[UIColor lightGrayColor]];
    [contributors setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [contributors setTitle:[NSString stringWithFormat:@"Contributors"] forState:UIControlStateNormal];
    [contributors.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:contributors];
}

- (void)viewDidLoad {
    
}

- (void) showOwnerPage {
    if (self.ownerUrl) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.ownerUrl]];
    }
}

- (void) showCotributorsPage {
    ContributorsTableViewController *contributorsTableView = [[ContributorsTableViewController alloc] init];
    contributorsTableView.contributorsUrl = self.contributorsUrl;
    [self.navigationController pushViewController:contributorsTableView animated:YES];
}

@end
