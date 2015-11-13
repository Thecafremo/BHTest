//
//  BHUserGateway.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface BHUserGateway : NSObject

+ (void)retrieveRemoteUsersSavingInContext:(NSManagedObjectContext *)context withResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock;

+ (void)retrieveAvatarImageForUser:(User *)user withResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock;

@end
