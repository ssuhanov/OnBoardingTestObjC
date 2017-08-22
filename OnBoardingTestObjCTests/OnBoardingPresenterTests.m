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

- (void)testNextImageExtractsCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.fullImageQueue];
    [self.instance showNextImageWithView:self.view];
    [verify(self.view) showImageWithName:self.correctNextImageName];
}

- (void)testImageQueueReducesCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.fullImageQueue];
    [self.instance showNextImageWithView:self.view];
    XCTAssertEqual(self.instance.imageQueue.count, self.fullImageQueue.count - 1, @"image queue should be reduced by one");
}

- (void)testButtonTitleUpdatesCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.fullImageQueue];
    [self.instance showNextImageWithView:self.view];
    [verify(self.view) updateButtonWithTitle:@"Продолжить"];
}

- (void)testPrepareForApplicationStartCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.lastImageQueue];
    [self.instance showNextImageWithView:self.view];
    [verify(self.view) updateButtonWithTitle:@"Старт"];
}

- (void)testApplicationStartsCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.emptyImageQueue];
    [self.instance showNextImageWithView:self.view];
    [verify(self.view) startApplication];
}

- (void)testLocalManagerSetsOnBoardingFlagCorrectly {
    self.instance = [[OnBoardingPresenter alloc] initWithImageQueue:self.emptyImageQueue];
    [self.instance showNextImageWithView:self.view andLocalManager:self.localManager];
    [verify(self.localManager) setFlagOnBoardingCompleted];
}

@end
