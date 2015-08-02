//
//  ContributorsTableViewController.m
//  GitHubClint
//
//  Created by y10uc256 on 8/3/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "ContributorsTableViewController.h"
#import "EventApiCalls.h"
#import "JsonParser.h"
@interface ContributorsTableViewController ()

@end

@implementation ContributorsTableViewController
static NSString *CellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Contributors"];
    [self fetchContributors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.contributorsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    UILabel *contributor = [[UILabel alloc] initWithFrame:cell.bounds];
    contributor.text = [[self.contributorsList objectAtIndex:indexPath.row] objectForKey:LOGIN];
    [contributor setTextAlignment:NSTextAlignmentCenter];
    [cell addSubview:contributor];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *contributorsUrl = [[self.contributorsList objectAtIndex:indexPath.row] objectForKey:OWNER_HTML_URL];
    if (contributorsUrl) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:contributorsUrl]];
    }
}

#pragma mark Event api method 
- (void) fetchContributors {
    [self showActivityIndicator];
    [[EventApiCalls sharedInstance] getDataFromUrlString:self.contributorsUrl withSuccessBlock:^(id jsonResp) {
        NSArray *contributors = [JsonParser getContributors:(NSArray *)jsonResp];
        if ([contributors count]) {
            self.contributorsList = contributors;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [self hideActivityIndicator];
            });
        }
    } andFailureBlock:^{
        [self showAlert];
        [self hideActivityIndicator];
    }];
}

#pragma mark customView

- (void) showAlert {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *popupMessage = [[NSString alloc] initWithFormat:@"Please check your network connection or try other repo"];
        UIAlertView *databaseMissing = [[UIAlertView alloc] initWithTitle:@"No Contributors Found" message:popupMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [databaseMissing show];
    });
}

- (void) showActivityIndicator {
    UIView *dimViewMask = [[UIView alloc] initWithFrame:self.tableView.bounds];
    [dimViewMask setUserInteractionEnabled:NO];
    [dimViewMask setAlpha:0.4];
    [dimViewMask setBackgroundColor:[UIColor lightGrayColor]];
    
    UIActivityIndicatorView *indicatore = [[UIActivityIndicatorView alloc] init];
    [indicatore setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicatore setCenter:dimViewMask.center];
    [indicatore startAnimating];
    [dimViewMask addSubview:indicatore];
    
    [self setDimViewMask:dimViewMask];
    [self setIndicator:indicatore];
    [self.view addSubview:dimViewMask];
}

-(void) hideActivityIndicator {
    [self.indicator stopAnimating];
    [self.dimViewMask removeFromSuperview];
}

@end
