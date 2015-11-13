//
//  User+Actions.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "User.h"

@interface User (Actions)

- (void)retrieveAvatarImageWithResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock;
+ (void)retrieveRemoteUsersWithCompletionBlock:(CompletionBlock)completionBlock;

@end
