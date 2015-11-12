//
//  BHTableViewCellDataSourceProtocol.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BHTableViewCellDataSourceProtocol <NSObject>

- (void)populateWithObject:(id)item;

@end
