//
//  BHManagedObject.m
//  JPPBabylonHealthTest
//
//  Created by Jorge Pardo on 12/11/15.
//  Copyright © 2015 MagicDealers. All rights reserved.
//

#import "BHManagedObject.h"

#import "NSManagedObject+Additions.h"
#import "NSDateFormatter+Additions.h"

@implementation BHManagedObject

@dynamic serverId;
@dynamic createdAt;
@dynamic updatedAt;

#pragma mark - Methods.

- (void)populateWithDictionary:(NSDictionary *)dictionary {
    
    //JP: To be overriden in Subclass.
    
    self.serverId = dictionary[@"id"];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter BH_serverDatesDateFormatter];

    self.createdAt = [dateFormatter dateFromString:dictionary[@"createdAt"]];
    self.updatedAt = [dateFormatter dateFromString:dictionary[@"updatedAt"]];
}


#pragma mark - Class'.

+ (instancetype)updateLocalDataBaseWithDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context {
    
    NSString *serverId = [dictionary valueForKeyPath:[self.class serverIdDictionaryKeyPath]];
    
    if (!dictionary || !serverId.length || !context) {
        return nil;
    }
    
    BHManagedObject *managedObject = [self findOrCreateManagedObjectForAttribute:@"serverId" withValue:serverId inContext:context];
    [managedObject populateWithDictionary:dictionary];
    
    return managedObject;
}


+ (instancetype)findOrCreateManagedObjectForAttribute:(NSString *)attribute withValue:(id)value inContext:(NSManagedObjectContext *)context {
    
    BHManagedObject *managedObject = [self BH_findFirstByAttribute:attribute withValue:value inContext:context];
    
    if (!managedObject) {
        managedObject = [self BH_createInContext:context];
    }
    
    return managedObject;
}


+ (NSArray *)updateLocalDataBaseWithDictionaries:(NSArray *)dictionariesArray inContext:(NSManagedObjectContext *)context {
    
    NSMutableArray *updatedObjectsArray = [NSMutableArray new];
    
    NSMutableSet *serverIdsSet = [[NSMutableSet alloc] initWithArray:[dictionariesArray valueForKeyPath:[self.class serverIdDictionaryKeyPath]]];
    NSArray *fetchedObjectsArray = [context executeFetchRequest:[self fetchRequestForObjectsWithServerIdInSet:serverIdsSet] error:nil];
    
    [dictionariesArray enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
        
        NSString *serverId = [dictionary valueForKeyPath:[self.class serverIdDictionaryKeyPath]];
        
        __block BHManagedObject *managedObject;
        __block BOOL matchFound = NO;
        
        [fetchedObjectsArray enumerateObjectsUsingBlock:^(BHManagedObject *localManagedObject, NSUInteger idx, BOOL *stop) {
            
            if ([localManagedObject.serverId isEqualToString:serverId]) {
                
                managedObject = localManagedObject;
                
                matchFound = YES;
                *stop = YES;
            }
        }];
        
        
        if (!matchFound) {
            
            managedObject = [self BH_createInContext:context];
            managedObject.serverId = serverId;
        }
        
        [managedObject populateWithDictionary:dictionary];
        
        [updatedObjectsArray addObject:managedObject];
    }];
    
    return updatedObjectsArray;
}


+ (NSString *)serverIdDictionaryKeyPath {
    return @"id";
}


#pragma mark - Helpers.

+ (NSFetchRequest *)fetchRequestForObjectsWithServerIdInSet:(NSSet *)parseIdsSet {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(self.class)];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"serverId IN %@", parseIdsSet];
    
    return fetchRequest;
}


@end
