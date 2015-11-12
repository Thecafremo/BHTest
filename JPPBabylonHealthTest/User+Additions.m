//
//  User+Additions.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "User+Additions.h"

@implementation User (Additions)

+ (NSFetchRequest *)fetchRequestForAllUsers {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"first_name" ascending:NO]];
    
    return fetchRequest;
}


@end
