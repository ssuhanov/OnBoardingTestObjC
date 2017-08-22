//
//  OnBoardingPresenter.m
//  OnBoardingTestObjC
//
//  Created by Serge Sukhanov on 8/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "OnBoardingPresenter.h"
#import "OnBoardingViewProtocol.h"
#import "OnBoardingLocalManager.h"
#import "OnBoardingImageManager.h"

@implementation OnBoardingPresenter

- (instancetype)initWithImageQueue:(NSArray<NSString *> *)imageQueue {
    self = [super init];
    if (self) {
        self.imageQueue = [imageQueue mutableCopy];
    }
    return self;
}

- (instancetype)init
{
    self = [self initWithImageQueue:[[[[OnBoardingImageManager alloc] init] getImageQueue] mutableCopy]];
    return self;
}

- (void)showNextImageWithView:(id<OnBoardingViewProtocol>)view {
    [self showNextImageWithView:view andLocalManager:[[OnBoardingLocalManager alloc] init]];
}

- (void)showNextImageWithView:(id<OnBoardingViewProtocol>)view andLocalManager:(OnBoardingLocalManager *)localManager {
    NSString *nextImageName = [self.imageQueue firstObject];
    if (nextImageName != nil) {
        [view showImageWithName:nextImageName];
        [self.imageQueue removeObjectAtIndex:0];
        if ([self.imageQueue firstObject] != nil) {
            [view updateButtonWithTitle:@"Продолжить"];
        } else {
            [view updateButtonWithTitle:@"Старт"];
        }
    } else {
        [view startApplication];
        [localManager setFlagOnBoardingCompleted];
    }
}

@end
