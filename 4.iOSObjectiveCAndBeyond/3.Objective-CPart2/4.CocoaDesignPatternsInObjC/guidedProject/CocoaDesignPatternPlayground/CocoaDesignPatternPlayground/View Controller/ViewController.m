//
//  ViewController.m
//  CocoaDesignPatternPlayground
//
//  Created by Alfredo Colon on 9/7/20.
//  Copyright © 2020 Alfredo Colon. All rights reserved.
//

#import "ViewController.h"
#import "PersonController.h"

@interface ViewController () <PersonControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PersonController *sharedInstanceA = PersonController.sharedPersonController;
    NSLog(@"Person Controller: %@", sharedInstanceA);
    
    PersonController *sharedInstanceB = PersonController.sharedPersonController;
    NSLog(@"Person Controller: %@", sharedInstanceB);
    
    PersonController.sharedPersonController.delegate = self;
}

// MARK: - PersonControllerDelegate

- (void)personController:(PersonController *)personController didObserveNewBirth:(nonnull id)person
{
    if ([person isKindOfClass:NSString.class]) {
        NSLog(@"%@ is a string!", person);
    }
    if ([person isMemberOfClass:NSString.class]) {
        NSLog(@"%@ is actually a NSString!!", person);
    } else {
        NSLog(@"We were wrong, %@ is actually a %@", person, NSStringFromClass([person class]));
    }
    NSLog(@"We detected a new birth! %@", person);
}

@end
