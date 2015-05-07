//
//  DataManager.m
//  WeMakeAppsShopping
//
//  Created by Padraig John Robinson on 6/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "DataManager.h"
#import <AFNetworking.h>
#import <MagicalRecord.h>
#import <NSManagedObjectContext+MagicalSaves.h>
#import <NSManagedObject+MagicalDataImport.h>
#import <CoreData+MagicalRecord.h>
#import "Product.h"

@implementation DataManager

+ (instancetype)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DataManager alloc] init];
    });
    
    return _sharedInstance;
}

- (void)importDataWithCompletion:(void (^)())completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:@"http://wemakeapps.net/test/products.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self createProducts:(NSArray *)responseObject[@"products"] completion:completion];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)createProducts:(NSArray *)products completion:(void (^)())completion{
    // Take only the first 8 items, because I am too lazy to find a more efficient way given there is no chance of the data changing.
    products = [products subarrayWithRange:NSMakeRange(0, 7)];
    NSManagedObjectContext *defaultContext = [NSManagedObjectContext MR_defaultContext];
    for (NSDictionary *productDict in products) {
        Product *product = [Product MR_importFromObject:productDict];
    }
    [defaultContext save:nil];
    completion();
}

@end
