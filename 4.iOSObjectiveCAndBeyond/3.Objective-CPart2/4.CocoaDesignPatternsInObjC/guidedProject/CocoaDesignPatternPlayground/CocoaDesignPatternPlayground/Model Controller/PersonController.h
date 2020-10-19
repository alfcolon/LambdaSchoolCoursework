//
//  PersonController.h
//  CocoaDesignPatternPlayground
//
//  Created by Alfredo Colon on 9/7/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Whatever comes first is available so now we can declare a delegate that conforms to the PersonControllerDelegate protocol
@protocol PersonControllerDelegate;

@interface PersonController : NSObject

//MARK: - Class Methods

// Creating a singleton:
// static let shared = PersonController()
+ (instancetype)sharedPersonController;
//@property (nonatomic, class, readonly) PersonController *sharedPersonController;

@property (nonatomic, weak) id<PersonControllerDelegate> delegate;
@end

@protocol PersonControllerDelegate <NSObject>

// required or optional, required is implicit
@required

@optional

- (void)personController:(PersonController *)personController didObserveNewBirth:(id)person;

@end

NS_ASSUME_NONNULL_END
