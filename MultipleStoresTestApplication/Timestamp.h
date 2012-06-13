//
//  Timestamp.h
//  MultipleStoresTestApplication
//
//  Created by Arnaud Coomans on 12/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Timestamp : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSData * colorData;
@property (nonatomic, retain) UIColor * color;
- (void)setColor:(UIColor *)aColor;
- (UIColor *)color;
@end
