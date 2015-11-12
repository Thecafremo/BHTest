//
//  BHTableViewCell.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHTableViewCell.h"

@implementation BHTableViewCell

#pragma mark - Methods.

- (void)populateWithObject:(id)object {
    
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"populateWith%@:", [object class]]);
    
    if ([self respondsToSelector:selector]) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:selector withObject:object];
#pragma clang diagnostic pop
        
    }
}


#pragma mark - Class Methods.

+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}

@end
