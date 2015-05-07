//
//  DetailViewController.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 5/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "DetailViewController.h"
#import "TextFieldTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import <NSManagedObject+MagicalFinders.h>
#import "Seller.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_product != newDetailItem) {
        _product = newDetailItem;
        
        // Update the view.
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.product.title;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (section == 1) ? 2 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
            NSURL *imageURL = [NSURL URLWithString:self.product.imageURL];
            [cell.imageView setImageWithURL:imageURL];
            break;
        }
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"LabelCell"];
            switch (indexPath.row) {
                case 0:
                {
                    NSArray *sellers = [Seller MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"self == %@", self.product.seller]];
                    Seller *seller = sellers.firstObject;
                    cell.textLabel.text = seller.name;
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@", self.product.price.stringValue];
                    break;
                }
                case 1:
                    cell.textLabel.text = self.product.sizes;
                    cell.detailTextLabel.text = nil;
                    break;
                default:
                    break;
            }
            break;
        }
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"DescriptionCell"];
            [(TextFieldTableViewCell *)cell setProductDescription:self.product.productDescription];
            break;
        }
        default:
            break;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    switch (indexPath.section) {
        case 0:
            height = 150;
            break;
        case 1:
            height = 44;
            break;
        case 2:
        {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
            height = [self.product.productDescription boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 50, MAXFLOAT)
                                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                                attributes: @{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                                              NSParagraphStyleAttributeName : paragraphStyle}
                                                                   context:nil].size.height + 20;
            break;
        }
        default:
            break;
    }
    return height;
}

@end
