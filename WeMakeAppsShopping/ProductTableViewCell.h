//
//  ProductTableViewCell.h
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *productTitle;
@property (nonatomic, strong) NSString *sizes;
@property (nonatomic, strong) UIImage  *image;


/**
 *  Configure the cell with a title, price and image url.
 *
 *  @param title     The title of the product.
 *  @param price     The price of the product.
 *  @param urlString The image url of the product.
 */
- (void)configureCellWithTitle:(NSString *)title
                      andPrice:(NSNumber *)price
                      andURLString:(NSString *)urlString;

@end
