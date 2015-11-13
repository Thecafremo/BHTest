//
//  BHRequestManager.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHRequestManager.h"

#import "User.h"

#import <AFNetworking/AFNetworking.h>

@implementation BHRequestManager

+ (void)makeGETCallToURL:(NSString *)URL withParameters:(NSDictionary *)parametersDictionary responseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock {
    
    AFHTTPRequestOperationManager *requestOperationManager = [AFHTTPRequestOperationManager manager];
    requestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestOperationManager GET:URL parameters:parametersDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseCompletionBlock) responseCompletionBlock(nil, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (responseCompletionBlock) responseCompletionBlock(error, nil);
    }];
}


+ (void)retrieveImageForURL:(NSString *)URL withResponseCompletionBlock:(ResponseCompletionBlock)responseCompletionBlock {
    
    AFHTTPRequestOperationManager *requestOperationManager = [AFHTTPRequestOperationManager manager];
    requestOperationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [requestOperationManager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, NSData *imageData) {
        if (responseCompletionBlock) responseCompletionBlock(nil, [UIImage imageWithData:imageData]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (responseCompletionBlock) responseCompletionBlock(error, nil);
    }];
}



@end
