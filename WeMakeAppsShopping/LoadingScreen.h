//
//  LoadingScreen.h
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingScreen : UIViewController

- (instancetype)initWithCompletion:(void (^)())completion;

@end
