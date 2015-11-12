//
//  BHTableViewDataSource.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHTableViewDataSource.h"

#import "BHTableViewCellDataSourceProtocol.h"

@interface BHTableViewDataSource ()

@property (nonatomic, strong) NSArray *itemsArray;

@end

@implementation BHTableViewDataSource

#pragma mark - Setters & Getters.

- (void)setDataArray:(NSArray *)dataArray {
    
    self.fetchedResultsController = nil;
    
    _dataArray = dataArray;
    
    if (dataArray && ![[dataArray firstObject] isKindOfClass:[NSArray class]]) {
        
        self.itemsArray = @[dataArray];
        return;
    }
    
    self.itemsArray = dataArray;
}


- (void)setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    
    _fetchedResultsController = fetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    [_fetchedResultsController performFetch:nil];
}


#pragma mark - Methods.

- (id)itemForIndexPath:(NSIndexPath *)indexPath {
    
    if (self.itemsArray) {
        
        NSArray *sectionArray = self.itemsArray[indexPath.section];
        return sectionArray[indexPath.row];
    }
    
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}


- (NSUInteger)numberOfItems {
    
    if (self.itemsArray) {
        return self.itemsArray.count;
    }
    
    return self.fetchedResultsController.fetchedObjects.count;
}


#pragma mark - UITableView DataSource's.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.itemsArray) {
        return self.itemsArray.count;
    }
    
    if (self.fetchedResultsController.sections.count > 0) {
        return self.fetchedResultsController.sections.count;
    }
    
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.itemsArray && section < self.itemsArray.count) {
        return [self.itemsArray[section] count];
    }
    
    if (self.fetchedResultsController.sections.count > 0 && section < self.fetchedResultsController.sections.count) {
        return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject *item = [self itemForIndexPath:indexPath];
    
    NSString *reuseIdentifier = (self.cellIdentifier) ?: NSStringFromClass(item.class);
    id cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if ([cell respondsToSelector:@selector(delegate)]) {
        [cell setValue:self.cellDelegate forKey:@"delegate"];
    }
    
    if (self.cellConfigureBlock) {
        self.cellConfigureBlock(cell, item, indexPath);
        
    } else if ([cell conformsToProtocol:@protocol(BHTableViewCellDataSourceProtocol)]) {
        [cell populateWithObject:item];
    }
    
    return cell;
}


#pragma mark - NSFetchedResultsController Delegate's.

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView reloadData];
            break;
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark - Class'.

+ (BHTableViewDataSource *)tableViewDataSourceWithTableView:(UITableView *)tableView fetchedResulstController:(NSFetchedResultsController *)fetchedResultsController cellDelegate:(id)cellDelegate {
    
    BHTableViewDataSource *tableViewDataSource = [BHTableViewDataSource new];
    tableViewDataSource.tableView = tableView;
    tableViewDataSource.cellDelegate = cellDelegate;
    tableViewDataSource.fetchedResultsController = fetchedResultsController;
    
    return tableViewDataSource;
}

@end
