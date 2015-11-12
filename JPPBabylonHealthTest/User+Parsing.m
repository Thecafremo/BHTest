//
//  User+Parsing.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "User+Parsing.h"

@implementation User (Parsing)

- (void)populateWithDictionary:(NSDictionary *)dictionary {
    
    [super populateWithDictionary:dictionary];
    
    self.first_name = dictionary[@"first_name"];
    self.surname = dictionary[@"surname"];
    self.address = dictionary[@"address"];
    self.phone_number = dictionary[@"phone_number"];
    self.email = dictionary[@"email"];
}


@end
