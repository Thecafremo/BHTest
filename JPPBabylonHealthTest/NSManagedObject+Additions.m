//
//  NSManagedObject+Additions.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "NSManagedObject+Additions.h"

@implementation NSManagedObject (Additions)

#pragma mark - Creations.

+ (instancetype)BH_createInContext:(NSManagedObjectContext *)context {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self appropriateEntityName] inManagedObjectContext:context];
    return [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
}


#pragma mark - Finders.

+ (NSArray *)BH_findAllInContext:(NSManagedObjectContext *)context {
    return nil;
}


+ (instancetype)BH_findFirstByAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self appropriateEntityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K = %@", attribute, value];
    
    return [[context executeFetchRequest:fetchRequest error:nil] firstObject];
}


#pragma mark - Helpers.

+ (NSString *)appropriateEntityName { //Courtesy of MR.
    
    NSString *entityName;
    
    if ([self respondsToSelector:@selector(entityName)]) {
        entityName = [self performSelector:@selector(entityName)];
    }
    
    if (entityName.length == 0) {
        // Remove module prefix from Swift subclasses
        entityName = [NSStringFromClass(self) componentsSeparatedByString:@"."].lastObject;
    }
    
    return entityName;
}

@end
