//
//  TextFieldTableViewCell.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 7/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "TextFieldTableViewCell.h"

@interface TextFieldTableViewCell()

@property (weak, nonatomic) IBOutlet UITextView *ibTextField;


@end

@implementation TextFieldTableViewCell

- (void)setProductDescription:(NSString *)productDescription {
    self.ibTextField.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    [self.ibTextField setText:productDescription];
}

@end
