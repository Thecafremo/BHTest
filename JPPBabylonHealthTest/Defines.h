//
//  Defines.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#pragma mark - Blocks.

typedef void(^CompletionBlock)(NSError *error);
typedef void(^ResponseCompletionBlock)(NSError *error, id responseObject);


#pragma mark - Macros.

#define WeakSelf __weak __typeof(self) weakSelf = self

#endif /* Defines_h */
