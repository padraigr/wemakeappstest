//
//  LoadingScreen.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "CustomLoadingScreen.h"
#import "DataManager.h"

@interface CustomLoadingScreen()

@property (nonatomic, copy) void (^completion)();

@end

@implementation CustomLoadingScreen

- (instancetype)initWithCompletion:(void (^)())completion {
    self = [super init];
    if (self) {
        self.completion = completion;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
    
    [[DataManager sharedManager] importDataWithCompletion:^{
        [activityIndicator stopAnimating];
        [activityIndicator removeFromSuperview];
        self.completion();
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

@end
