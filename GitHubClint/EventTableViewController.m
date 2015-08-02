//
//  EventTableViewController.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "EventTableViewController.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController

- (void)loadView {
    [super loadView];
    [[EventApiCalls sharedInstance] setEventDelegate:self];
    [self setIsFetchingData:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Events"];
    [self showActivityIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}

#pragma mark Event Delegate method

- (void) fetchEventSuccess:(NSArray *)eventArray {
    NSLog(@"%@",eventArray);
}

#pragma mark customView

- (void) showActivityIndicator {
    UIView *dimViewMask = [[UIView alloc] initWithFrame:self.view.bounds];
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
