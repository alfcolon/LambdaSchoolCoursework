//
//  PersonController.m
//  CocoaDesignPatternPlayground
//
//  Created by Alfredo Colon on 9/7/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

#import "PersonController.h"
#import "Person.h"

@implementation PersonController

// Singleton as a computed property/class method
+ (instancetype)sharedPersonController
{
    static PersonController *personController = nil;
    
    // Preferred way of creating a singleton
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        personController = [[self alloc] initSharedInstance];
    });
    
    // Naive implentation
//    if (!personController) {
//        personController = [[self alloc] init];
//    }
    
    return personController;
}

- (instancetype)initSharedInstance
{
    if (self = [super init]) {
        // Configure the shared instance any way you'd like
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(recordNewBirth:) userInfo:nil repeats:YES];
        
    }
    
    return self;
}

- (IBAction)recordNewBirth:(id)sender
{
//    if ([self.delegate conformsToProtocol:@protocol(PersonControllerDelegate)]) { // not a good method
    if ([self.delegate respondsToSelector:@selector(personController:didObserveNewBirth:)]) {
        Person *person = [[Person alloc]init];
        
        // This line will only be reached when the delegate is not  nil and the delegate has been implemented (implemeneted in ViewController)
        [self.delegate personController:self didObserveNewBirth:person];
    }
}


@end
