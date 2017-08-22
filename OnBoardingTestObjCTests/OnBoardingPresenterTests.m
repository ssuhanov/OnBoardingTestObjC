//
//  OnBoardingPresenterTests.m
//  OnBoardingTestObjC
//
//  Created by Serge Sukhanov on 8/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OnBoardingPresenter.h"
#import "OnBoardingViewProtocol.h"
#import "OnBoardingLocalManager.h"
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>

@interface OnBoardingPresenterTests : XCTestCase

@property (strong, nonatomic) OnBoardingPresenter *instance;

@property (strong, nonatomic) id<OnBoardingViewProtocol> view;
@property (strong, nonatomic) OnBoardingLocalManager *localManager;

@property (strong, nonatomic) NSString *correctNextImageName;
@property (strong, nonatomic) NSArray<NSString *> *fullImageQueue;
@property (strong, nonatomic) NSArray<NSString *> *lastImageQueue;
@property (strong, nonatomic) NSArray<NSString *> *emptyImageQueue;

@end

@implementation OnBoardingPresenterTests

- (void)setUp {
    [super setUp];
    
    self.view = mockProtocol(@protocol(OnBoardingViewProtocol));
    self.localManager = mock([OnBoardingLocalManager class]);
    
    self.correctNextImageName = @"correctNextImageName";
    self.fullImageQueue = @[self.correctNextImageName, @"something", @"something else"];
    self.lastImageQueue = @[@"something"];
    self.emptyImageQueue = @[];
}

@end
