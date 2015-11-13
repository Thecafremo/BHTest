//
//  User+Actions.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "User+Actions.h"

#import "BHUserGateway.h"
#import "BHCoreDataManager.h"

@implementation User (Actions)

- (void)retrieveAvatarImageWithResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock {
    
    if (self.avatarImage) {
        
        if (responseCompletionBlock) responseCompletionBlock(nil, self.avatarImage);
        return;
    }
    
    
    [BHUserGateway retrieveAvatarImageForUser:self withResponseCompletionBlock:^(NSError *error, UIImage *image) {
        
        self.avatarImage = image;
        self.updatedAt = [NSDate date];
        
        if (responseCompletionBlock) responseCompletionBlock(nil, image);
    }];
}


+ (void)retrieveRemoteUsersWithCompletionBlock:(CompletionBlock)completionBlock {
    
    [BHUserGateway retrieveRemoteUsersSavingInContext:[BHCoreDataManager sharedInstance].backgroundContext withResponseCompletionBlock:^(NSError *error, id responseObject) {
        if (completionBlock) completionBlock(error);
    }];
}


@end
