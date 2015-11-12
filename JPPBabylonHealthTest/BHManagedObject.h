//
//  BHManagedObject.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface BHManagedObject : NSManagedObject

@property (nonatomic, retain) NSString *serverId;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;

- (void)populateWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)updateLocalDataBaseWithDictionaries:(NSArray *)dictionariesArray inContext:(NSManagedObjectContext *)context;

@end
