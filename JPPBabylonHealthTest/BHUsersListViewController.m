//
//  BHUsersListViewController.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHUsersListViewController.h"
#import "BHUserTableViewCell.h"
#import "BHTableViewDataSource.h"
#import "BHCoreDataManager.h"

#import "User+Additions.h"
#import "User+Actions.h"

@interface BHUsersListViewController ()

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BHTableViewDataSource *tableViewDataSource;

@property (nonatomic, assign) BOOL isRetrievingData;

@end

@implementation BHUsersListViewController

#pragma mark - LifeCycle's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureTableView];
    [self updateUsers];
}


#pragma mark - Setters & Getters.

- (UIRefreshControl *)refreshControl {
    
    if (!_refreshControl) {
        
        _refreshControl = [UIRefreshControl new];
        [_refreshControl addTarget:self action:@selector(pullToRefreshHandler) forControlEvents:UIControlEventValueChanged];
    }
    
    return _refreshControl;
}


#pragma mark - Methods.

- (void)configureTableView {
    
    [self.tableView addSubview:self.refreshControl];
    
    [self.tableView registerClass:[BHUserTableViewCell class] forCellReuseIdentifier:@"User"];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:[User fetchRequestForAllUsers] managedObjectContext:[BHCoreDataManager sharedInstance].defaultContext sectionNameKeyPath:nil cacheName:nil];
    
    self.tableViewDataSource = [BHTableViewDataSource tableViewDataSourceWithTableView:self.tableView fetchedResulstController:fetchedResultsController cellDelegate:nil];
    self.tableView.dataSource = self.tableViewDataSource;
}


#pragma mark - Actions.

- (void)pullToRefreshHandler {
    [self updateUsers];
}


- (void)updateUsers {
    
    if (self.isRetrievingData) {
        return;
    }
    
    self.isRetrievingData = YES;
    
    [User retrieveRemoteUsersWithCompletionBlock:^(NSError *error) {
        
        if (error != nil) {
            
            [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
            
            return;
        }
        
        self.isRetrievingData = NO;
    }];
}


@end
