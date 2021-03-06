//
//  BHContactDetailsViewController.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHContactDetailsViewController.h"
#import "BHTableViewDataSource.h"
#import "BHContactDetail.h"

#import "User+Actions.h"

static NSString * const kDetailCellIdentifier = @"detailCell";

@interface BHContactDetailsViewController ()

@property (nonatomic, strong) User *user;

@property (nonatomic, strong) NSArray *contactDetailsArray;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BHTableViewDataSource *tableViewDataSource;

@end

@implementation BHContactDetailsViewController

#pragma mark - LifeCycle's.

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configureTableView];
    [self configureViewController];
}


#pragma mark - Setters & Getters.

- (NSArray *)contactDetailsArray {
    
    if (!_contactDetailsArray) {
        _contactDetailsArray = [BHContactDetail contactDetailsForUser:self.user];
    }
    
    
    return _contactDetailsArray;
}


#pragma mark - Methods.

- (void)populateWithUser:(User *)user {
    self.user = user;
}


- (void)configureTableView {
    
    self.tableViewDataSource = [BHTableViewDataSource new];
    self.tableViewDataSource.dataArray = self.contactDetailsArray;
    self.tableViewDataSource.cellIdentifier = kDetailCellIdentifier;
    self.tableViewDataSource.cellConfigureBlock = ^(UITableViewCell *cell, BHContactDetail *contactDetail, NSIndexPath *indexPath) {
        
        cell.textLabel.text = contactDetail.title;
        cell.detailTextLabel.text = contactDetail.value;
    };
    
    self.tableView.dataSource = self.tableViewDataSource;
}


- (void)configureViewController {
    
    WeakSelf;
    [self.user retrieveAvatarImageWithResponseCompletionBlock:^(NSError *error, UIImage *image) {
        weakSelf.imageView.image = image;
    }];
}


@end
