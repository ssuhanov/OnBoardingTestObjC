//
//  OnBoardingPresenter.h
//  OnBoardingTestObjC
//
//  Created by Serge Sukhanov on 8/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OnBoardingViewProtocol;
@class OnBoardingLocalManager;

@interface OnBoardingPresenter : NSObject

@property (strong, nonatomic) NSMutableArray<NSString *> *imageQueue;

- (instancetype)initWithImageQueue:(NSArray<NSString *> *)imageQueue;
- (void)showNextImageWithView:(id<OnBoardingViewProtocol>)view;
- (void)showNextImageWithView:(id<OnBoardingViewProtocol>)view andLocalManager:(OnBoardingLocalManager *)localManager;

@end
