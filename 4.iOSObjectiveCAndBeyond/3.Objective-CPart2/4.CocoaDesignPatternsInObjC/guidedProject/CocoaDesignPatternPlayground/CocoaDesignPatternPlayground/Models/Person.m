//
//  Person.m
//  CocoaDesignPatternPlayground
//
//  Created by Alfredo Colon on 9/7/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)aName
                   birthDate:(NSDate *)aBirthDate
                   hairColor:(PersonHairColor)aHairColor
{
    if (self = [super init]) {
        _fullName = aName.copy;
        _birthDate = aBirthDate;
        _hairColor = aHairColor;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        return [self initWithName:[self generateRandomName] birthDate:NSDate.now hairColor:arc4random_uniform(5)]; // random number between 0...4
    }
    return self;
}

- (NSString *)generateRandomName
{
    static NSArray *firstNames = nil;
    static NSArray *lastNames = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        firstNames = @[@"Dimitri", @"Skyler", @"Chris", @"Joshua"];
        lastNames = @[@"Sharp", @"Gonzales", @"Suzuki", @"Bouniol"];
    });
    
    NSUInteger randomIndex = arc4random_uniform((uint32_t)firstNames.count);
    NSString *randomFirstName = [firstNames objectAtIndex:randomIndex];
    NSString *randomLastName = [lastNames objectAtIndex:arc4random_uniform((uint32_t)lastNames.count)];
    
    return [NSString stringWithFormat:@"%@ %@", randomFirstName, randomLastName];
}

- (NSString *)description
{
    static NSDictionary<NSNumber *, NSString *> *hairLookup = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hairLookup = @{
            @(PersonHairColorBlonde): @"Blonde",
            @(PersonHairColorBrown): @"Brown",
            @(PersonHairColorRed): @"Red",
            @(PersonHairColorBlue): @"Blue",
            @(PersonHairColorOrange): @"Orange",
        };
    });
    
    NSString *hairColorString = [hairLookup objectForKey:@(self.hairColor)];
    
    return [NSString stringWithFormat:@"<%@: %p %@, born %@, with hair color %@>",
            NSStringFromClass(self.class), self, self.fullName, self.birthDate, hairColorString];
}

@end
