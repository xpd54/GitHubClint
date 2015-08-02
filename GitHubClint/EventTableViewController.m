//
//  EventTableViewController.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "EventTableViewController.h"
#import "JsonParser.h"
#import "EventTableViewCell.h"
#import "EventApiCalls.h"
#import "RepoInfoViewController.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController
static NSString *CellIdentifier = @"Cell";

- (void)loadView {
    [super loadView];
    [self setIsFetchingData:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Events"];
    [self showActivityIndicator];
    [self fetchEventApiData];
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
    return [self.eventData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[EventTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.repositoryName = [[self.eventData objectAtIndex:indexPath.row] objectForKey:REPOSITORY_NAME];
    cell.url = [[self.eventData objectAtIndex:indexPath.row] objectForKey:REPO_URL];
    cell.userName = [[self.eventData objectAtIndex:indexPath.row] objectForKey:USERNAME];
    return cell;
}

#pragma mark tableView Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoInfoViewController *repoInfoViewController = [[RepoInfoViewController alloc] init];
    [self.navigationController pushViewController:repoInfoViewController animated:YES];
}

#pragma mark Fetch Api Data

- (void) fetchEventApiData {
    [[EventApiCalls sharedInstance] getDataFromUrlString:API_URL_STRING withSuccessBlock:^(id jsonResp) {
        NSArray *eventResponse = (NSArray *)jsonResp;
        NSArray *eventData = [JsonParser getListOfEvents:eventResponse];
        if ([eventData count]) {
            self.eventData = eventData;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                [self hideActivityIndicator];
            });
        }
    } andFailureBlock:^{
        NSLog(@"fiiuuhh");
    }];
}


#pragma mark customView

- (void) showActivityIndicator {
    UIView *dimViewMask = [[UIView alloc] initWithFrame:self.tableView.bounds];
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
    [self setIsFetchingData:NO];
}
@end
