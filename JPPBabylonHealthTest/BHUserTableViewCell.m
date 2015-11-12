//
//  BHUserTableViewCell.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHUserTableViewCell.h"

#import "User.h"

@implementation BHUserTableViewCell

#pragma mark - Methods.

- (void)populateWithUser:(User *)user {
    
    self.textLabel.text = user.first_name;
    self.detailTextLabel.text = user.surname;
}


@end
