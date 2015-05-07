//
//  Product.m
//  
//
//  Created by Padraig John Robinson on 6/05/2015.
//
//

#import "Product.h"

@implementation Product

@dynamic productID;
@dynamic title;
@dynamic price;
@dynamic imageURL;
@dynamic productDescription;
@dynamic seller;
@dynamic sizes;

- (BOOL)importSizes:(id)data {
    NSString *sizesString = @"";
    for (NSString *size in data) {
        if ([sizesString isEqualToString:@""]) {
            sizesString = size;
        }
        else {
            sizesString = [sizesString stringByAppendingString:@", "];
            sizesString = [sizesString stringByAppendingString:size];
        }
    }
    self.sizes = sizesString;
    return YES;
}

@end
