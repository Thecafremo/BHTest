//
//  BHCoreDataManager.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "NSManagedObject+Additions.h"
#import "NSManagedObjectContext+Additions.h"

@interface BHCoreDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *backgroundContext;
@property (nonatomic, strong) NSManagedObjectContext *defaultContext;

@property (nonatomic, strong) NSURL *persistentStorePathURL;

- (void)tearDownCoreDataStack;

+ (BHCoreDataManager *)sharedInstance;

@end
