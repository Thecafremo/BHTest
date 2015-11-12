//
//  BHContactDetailsViewController.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface BHContactDetailsViewController : UIViewController

- (void)populateWithUser:(User *)user;

@end
