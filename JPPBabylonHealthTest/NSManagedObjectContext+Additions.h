//
//  NSManagedObjectContext+Additions.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Additions)

- (void)BH_saveWithCompletionBlock:(CompletionBlock)completionBlock;

@end
