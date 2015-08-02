//
//  ViewController.m
//  GitHubClint
//
//  Created by y10uc256 on 8/2/15.
//  Copyright (c) 2015 xpd54.com. All rights reserved.
//

#import "ViewController.h"
#import "EventTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    UIButton *gitHub = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,
                                                                  self.view.bounds.origin.y,
                                                                  150,
                                                                  50)];
    [gitHub.layer setCornerRadius:4];
    gitHub.center = self.view.center;
    [gitHub setBackgroundColor:[UIColor darkGrayColor]];
    [gitHub setTitle:@"Clint" forState:UIControlStateNormal];
    [gitHub setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [gitHub addTarget:self action:@selector(showEventTable) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:gitHub];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"GitHub"];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
}

- (void) showEventTable {
    EventTableViewController *eventTableViewController = [[EventTableViewController alloc] init];
    [self.navigationController pushViewController:eventTableViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
