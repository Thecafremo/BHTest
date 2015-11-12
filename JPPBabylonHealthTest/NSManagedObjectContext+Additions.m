//
//  NSManagedObjectContext+Additions.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "NSManagedObjectContext+Additions.h"

@implementation NSManagedObjectContext (Additions)

#pragma mark - Saves.

- (void)BH_saveWithCompletionBlock:(CompletionBlock)completionBlock {
    
    if (!self.hasChanges) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) completionBlock(nil);
        });
        
        return;
    }
    
    
    [self performBlockAndWait:^{
        
        NSError *error = nil;
        
        [self save:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) completionBlock(error);
        });
    }];
}

@end
