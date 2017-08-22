//
//  OnBoardingViewProtocol.h
//  OnBoardingTestObjC
//
//  Created by Serge Sukhanov on 8/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

@protocol OnBoardingViewProtocol <NSObject>

- (void)showImageWithName:(NSString *)imageName;
- (void)updateButtonWithTitle:(NSString *)title;
- (void)startApplication;

@end
