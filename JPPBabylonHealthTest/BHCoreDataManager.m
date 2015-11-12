//
//  BHCoreDataManager.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHCoreDataManager.h"

@interface BHCoreDataManager ()

@property (nonatomic, strong) NSManagedObjectContext *rootContext;

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSPersistentStore *persistentStore;

@end

@implementation BHCoreDataManager

#pragma mark - LifeCycle's.

+ (BHCoreDataManager *)sharedInstance {
    
    static BHCoreDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [BHCoreDataManager new];
    });
    
    return instance;
}


#pragma mark - Setters & Getters.

- (NSManagedObjectContext *)backgroundContext {
    
    if (!_backgroundContext) {
        _backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        _backgroundContext.parentContext = self.defaultContext;
    }
    
    return _backgroundContext;
}


- (NSManagedObjectContext *)defaultContext {
    
    if (!_defaultContext) {
        _defaultContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _defaultContext.parentContext = self.rootContext;
    }
    
    return _defaultContext;
}


- (NSManagedObjectContext *)rootContext {
    
    if (!_rootContext) {
        _rootContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        _rootContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    
    return _rootContext;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (!_persistentStoreCoordinator) {
        
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.persistentStorePathURL options:nil error:nil];
    }
    
    return _persistentStoreCoordinator;
}


- (NSURL *)persistentStorePathURL {
    
    if (!_persistentStorePathURL) {
        _persistentStorePathURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"store.sqlite"]];
    }
    
    return _persistentStorePathURL;
}


#pragma mark - Methods.

- (void)tearDownCoreDataStack {
    
    self.backgroundContext = nil;
    self.defaultContext = nil;
    self.rootContext = nil;
    
    
    NSURL *shmStoreFileURL = [NSURL URLWithString:[[self.persistentStorePathURL absoluteString] stringByAppendingString:@"-shm"]];
    NSURL *walStoreFileURL = [NSURL URLWithString:[[self.persistentStorePathURL absoluteString] stringByAppendingString:@"-wal"]];
    
    [[NSFileManager defaultManager] removeItemAtURL:self.persistentStorePathURL error:nil];
    [[NSFileManager defaultManager] removeItemAtURL:shmStoreFileURL error:nil];
    [[NSFileManager defaultManager] removeItemAtURL:walStoreFileURL error:nil];
}

@end
