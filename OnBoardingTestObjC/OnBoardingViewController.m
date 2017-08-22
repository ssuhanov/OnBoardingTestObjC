//
//  OnBoardingViewController.m
//  OnBoardingTestObjC
//
//  Created by Serge Sukhanov on 8/22/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

#import "OnBoardingViewController.h"
#import "OnBoardingPresenter.h"

@interface OnBoardingViewController ()

@property (strong, nonatomic) OnBoardingPresenter *presenter;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation OnBoardingViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.presenter = [[OnBoardingPresenter alloc] init];
}

- (IBAction)continueAction:(UIButton *)sender {
    
}

@end
