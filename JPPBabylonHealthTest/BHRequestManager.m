//
//  BHRequestManager.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHRequestManager.h"

#import <AFNetworking/AFNetworking.h>

@implementation BHRequestManager

+ (void)makeGETCallToURL:(NSString *)URL withParameters:(NSDictionary *)parametersDictionary responseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock {
    
    AFHTTPRequestOperationManager *requestOperationManager = [AFHTTPRequestOperationManager manager];
    requestOperationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [requestOperationManager GET:URL parameters:parametersDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseCompletionBlock) responseCompletionBlock(nil, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (responseCompletionBlock) responseCompletionBlock(error, nil);
    }];
}


@end
