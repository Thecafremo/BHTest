//
//  ContactDetail.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHContactDetail.h"

#import "User.h"

#import "NSDateFormatter+Additions.h"

@interface BHContactDetail ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value;

@end

@implementation BHContactDetail

#pragma mark - Class.

+ (NSArray *)contactDetailsForUser:(User *)user {
    
    NSMutableArray *contactDetailsArray = [NSMutableArray array];
    
    NSArray *titlesArray = @[@"first_name", @"surname", @"address", @"phone_number", @"email"];
    
    [titlesArray enumerateObjectsUsingBlock:^(NSString *title, NSUInteger index, BOOL * _Nonnull stop) {
        
        NSString *value = [user valueForKey:title];
        
        if (!value) {
            return;
        }
    
        [contactDetailsArray addObject:[BHContactDetail contactDetailWithTitle:NSLocalizedString(title, nil) value:value]];
    }];
    
    

    NSDateFormatter *dateFormatter = [NSDateFormatter BH_dateFormatter];
    
    if (user.createdAt) {
        [contactDetailsArray addObject:[BHContactDetail contactDetailWithTitle:NSLocalizedString(@"Created at", nil)
                                                                         value:[dateFormatter stringFromDate:user.createdAt]]];
    }
    
    if (user.updatedAt) {
        [contactDetailsArray addObject:[BHContactDetail contactDetailWithTitle:NSLocalizedString(@"Updated at", nil)
                                                                         value:[dateFormatter stringFromDate:user.updatedAt]]];
    }
    
    return contactDetailsArray;
}


+ (BHContactDetail *)contactDetailWithTitle:(NSString *)title value:(NSString *)value {
    
    BHContactDetail *contactDetail = [BHContactDetail new];
    contactDetail.title = title;
    contactDetail.value = value;
    
    return contactDetail;
}


@end
