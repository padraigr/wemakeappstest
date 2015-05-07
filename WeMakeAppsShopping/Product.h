//
//  Product.h
//  
//
//  Created by Padraig John Robinson on 6/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * productID;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * productDescription;
@property (nonatomic, retain) NSManagedObject *seller;
@property (nonatomic, retain) NSString *sizes;

@end

@interface Product (CoreDataGeneratedAccessors)

- (BOOL)importSizes:(id)data;

@end
