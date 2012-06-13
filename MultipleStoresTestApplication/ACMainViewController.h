//
//  ACMainViewController.h
//  MultipleStoresTestApplication
//
//  Created by Arnaud Coomans on 12/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACMainViewController : UITableViewController
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) NSDateFormatter *dateFormat;
- (IBAction)addButtonTapped:(id)sender;
- (void)getData;
@end
