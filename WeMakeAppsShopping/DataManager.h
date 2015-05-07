//
//  DataManager.h
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 6/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataManager : NSObject

/**
 *  @return the shared Data Manager
 */
+ (instancetype)sharedManager;

/**
 *  Import data from the remote URL and store in Core Data.
 */
- (void)importData;

@end
