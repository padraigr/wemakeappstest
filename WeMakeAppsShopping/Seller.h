//
//  Seller.h
//  
//
//  Created by Padraig John Robinson on 6/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Seller : NSManagedObject

@property (nonatomic, retain) NSNumber * sellerID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *products;
@end

@interface Seller (CoreDataGeneratedAccessors)

- (void)addProductsObject:(Product *)value;
- (void)removeProductsObject:(Product *)value;
- (void)addProducts:(NSSet *)values;
- (void)removeProducts:(NSSet *)values;

@end
