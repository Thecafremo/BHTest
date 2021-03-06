//
//  BHUserTableViewCell.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHUserTableViewCell.h"

#import "User+Actions.h"

#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation BHUserTableViewCell

#pragma mark - LifeCycle's.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}


#pragma mark - Methods.

- (void)populateWithUser:(User *)user {
    
    WeakSelf;
    [user retrieveAvatarImageWithResponseCompletionBlock:^(NSError *error, UIImage *image) {
        weakSelf.imageView.image = image;
    }];
    
    self.textLabel.text = user.first_name;
    self.detailTextLabel.text = user.surname;
}


@end
