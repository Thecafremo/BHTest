//
//  NSManagedObject+Additions.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Additions)

#pragma mark - Creations.

+ (instancetype)BH_createInContext:(NSManagedObjectContext *)context;


#pragma mark - Finders.

+ (NSArray *)BH_findAllInContext:(NSManagedObjectContext *)context;
+ (instancetype)BH_findFirstByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context;

@end
