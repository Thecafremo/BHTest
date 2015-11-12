//
//  BHTableViewCell.h
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHTableViewCellDataSourceProtocol.h"

@interface BHTableViewCell : UITableViewCell <BHTableViewCellDataSourceProtocol>

+ (UINib *)nib;

@end
