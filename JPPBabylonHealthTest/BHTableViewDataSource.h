//
//  BHTableViewDataSource.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BHTableViewDataSource : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) id cellDelegate;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSString *cellIdentifier;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, copy) void (^cellConfigureBlock) (id cell, id item, NSIndexPath *indexPath);

- (id)itemForIndexPath:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfItems;

+ (BHTableViewDataSource *)tableViewDataSourceWithTableView:(UITableView *)tableView fetchedResulstController:(NSFetchedResultsController *)fetchedResultsController cellDelegate:(id)cellDelegate;

@end
