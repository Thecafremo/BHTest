//
//  NSDateFormatter+Additions.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "NSDateFormatter+Additions.h"

@implementation NSDateFormatter (Additions)

+ (NSDateFormatter *)BH_serverDatesDateFormatter {
    
    NSDateFormatter *dateFormmater = [NSDateFormatter new];
    [dateFormmater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    
    return dateFormmater;
}


+ (NSDateFormatter *)BH_dateFormatter {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd/MM/yy"];
    
    return dateFormatter;
}

@end
