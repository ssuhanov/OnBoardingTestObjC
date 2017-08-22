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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter showNextImageWithView:self];
}

- (IBAction)continueAction:(UIButton *)sender {
    [self.presenter showNextImageWithView:self];
}

#pragma mark - OnBoardingViewProtocol

- (void)showImageWithName:(NSString *)imageName {
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (void)updateButtonWithTitle:(NSString *)title {
    [self.continueButton setTitle:title forState:UIControlStateNormal];
}

- (void)startApplication {
    // some logic for application start
    NSLog(@"Application is started");
}

@end
