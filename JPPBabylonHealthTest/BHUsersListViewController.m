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

@interface BHUsersListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BHTableViewDataSource *tableViewDataSource;

@end

@implementation BHUsersListViewController

#pragma mark - LifeCycle's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configureTableView];
}


#pragma mark - Methods.

- (void)configureTableView {
    
    [self.tableView registerClass:[BHUserTableViewCell class] forCellReuseIdentifier:@"User"];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:[User fetchRequestForAllUsers] managedObjectContext:[BHCoreDataManager sharedInstance].defaultContext sectionNameKeyPath:nil cacheName:nil];
    
    self.tableViewDataSource = [BHTableViewDataSource tableViewDataSourceWithTableView:self.tableView fetchedResulstController:fetchedResultsController cellDelegate:nil];
    self.tableView.dataSource = self.tableViewDataSource;
}


@end
