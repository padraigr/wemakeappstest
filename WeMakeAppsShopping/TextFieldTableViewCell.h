//
//  TextFieldTableViewCell.h
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldTableViewCell : UITableViewCell

/**
 *  Set the product description text to be shown in this cell.
 *
 *  @param productDescription The product description string.
 */
- (void)setProductDescription:(NSString *)productDescription;

@end
