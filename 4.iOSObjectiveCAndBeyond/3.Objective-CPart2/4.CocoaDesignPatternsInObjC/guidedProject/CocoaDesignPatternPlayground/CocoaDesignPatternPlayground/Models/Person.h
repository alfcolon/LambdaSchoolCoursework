//
//  Person.h
//  CocoaDesignPatternPlayground
//
//  Created by Alfredo Colon on 9/7/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PersonHairColor) {
    PersonHairColorBrown = 0,
    PersonHairColorBlonde = 1,
    PersonHairColorOrange = 2,
    PersonHairColorBlue  = 3,
    PersonHairColorRed = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *fullName;
@property (nonatomic) NSDate *birthDate;
@property (nonatomic) PersonHairColor hairColor;

- (instancetype)initWithName:(NSString *)aName
                   birthDate:(NSDate *)aBirthDate
                   hairColor:(PersonHairColor)aHairColor NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
