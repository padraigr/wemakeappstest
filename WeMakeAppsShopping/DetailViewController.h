//
//  DetailViewController.h
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 5/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface DetailViewController : UITableViewController

/**
 *  The product that the page will show details for.
 */
@property (strong, nonatomic) Product *product;

@end

