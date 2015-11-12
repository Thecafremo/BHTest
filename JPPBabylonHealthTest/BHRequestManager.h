//
//  BHRequestManager.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHRequestManager : NSObject

+ (void)makeGETCallToURL:(NSString *)URL withParameters:(NSDictionary *)parametersDictionary responseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock;

@end
