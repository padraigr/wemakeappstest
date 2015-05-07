//
//  MasterViewController.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 5/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "MasterViewController.h"
#import "ProductTableViewCell.h"
#import "DetailViewController.h"
#import <NSManagedObject+MagicalFinders.h>
#import <CoreData+MagicalRecord.h>
#import "Product.h"
#import "Seller.h"
#import "CustomLoadingScreen.h"

@interface MasterViewController ()

@property NSArray  *products;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    __block MasterViewController *weakSelf = self;
    void(^completion)() = ^() {
        // Retrieve all products and reload the table data.
        weakSelf.products = [Product MR_findAllSortedBy:@"title" ascending:YES];
        [weakSelf.tableView reloadData];
    };
    [self.navigationController pushViewController:[[CustomLoadingScreen alloc] initWithCompletion:completion] animated:NO];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Product *product = self.products[indexPath.row];
        [[segue destinationViewController] setProduct:product];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    Product *product = self.products[indexPath.row];
    [cell configureCellWithTitle:product.title andPrice:product.price andURLString:product.imageURL];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
