//
//  User.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHManagedObject.h"

@interface User : BHManagedObject

@property (nonatomic, retain) NSString *first_name;
@property (nonatomic, retain) NSString *surname;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *phone_number;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;

@property (nonatomic, strong) UIImage *avatarImage;

@end
