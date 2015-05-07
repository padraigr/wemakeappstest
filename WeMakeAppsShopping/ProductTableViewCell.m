//
//  ProductTableViewCell.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "ProductTableViewCell.h"
#import <UIImageView+AFNetworking.h>

@interface ProductTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *ibImageView;
@property (weak, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ibSubTitleLabel;

@end

@implementation ProductTableViewCell

- (void)awakeFromNib {
}

- (void)configureCellWithTitle:(NSString *)productTitle
                      andPrice:(NSNumber *)price
                      andURLString:(NSString *)urlString {
    self.ibTitleLabel.text = productTitle;
    self.ibSubTitleLabel.text = [NSString stringWithFormat:@"$%@", price.stringValue];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    [self.ibImageView setImageWithURL:imageURL];
}


@end
