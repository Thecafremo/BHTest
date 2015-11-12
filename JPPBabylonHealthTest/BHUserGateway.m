//
//  BHUserGateway.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHUserGateway.h"
#import "BHRequestManager.h"
#import "BHCoreDataManager.h"

#import "User+Parsing.h"

static NSString * const kRetrieveUsersAPIURL = @"http://fast-gorge.herokuapp.com/contacts";

@implementation BHUserGateway

+ (void)retrieveRemoteUsersSavingInContext:(NSManagedObjectContext *)context withResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock {
    
    [BHRequestManager makeGETCallToURL:kRetrieveUsersAPIURL withParameters:nil responseCompletionBlock:^(NSError *error, NSArray *usersDictionariesArray) {
       
        if (error != nil) {
            
            if (responseCompletionBlock) responseCompletionBlock(error, nil);
            return;
        }
        
        
        [context performBlock:^{
            
            NSArray *usersArray = [User updateLocalDataBaseWithDictionaries:usersDictionariesArray inContext:context];
            
            [context BH_saveWithCompletionBlock:^(NSError *error) {
                if (responseCompletionBlock) responseCompletionBlock(error, usersArray);
            }];
        }];
    }];
}


@end
