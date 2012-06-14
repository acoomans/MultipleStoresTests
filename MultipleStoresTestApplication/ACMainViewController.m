//
//  ACMainViewController.m
//  MultipleStoresTestApplication
//
//  Created by Arnaud Coomans on 12/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ACMainViewController.h"
#import "Timestamp.h"

@interface ACMainViewController ()

@end

@implementation ACMainViewController

@synthesize context, array, dateFormat;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.dateFormat = [[NSDateFormatter alloc] init];
	self.dateFormat.dateFormat = @"yyyyMMdd HH:mm:ss ZZZZ";
	[self getData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	Timestamp *timestamp = [self.array objectAtIndex:indexPath.row];
	cell.textLabel.text = [self.dateFormat stringFromDate:timestamp.date]; 
	cell.textLabel.textColor = timestamp.color;
    
    return cell;
}





#pragma mark - button

- (void)addButtonTapped:(id)sender {
	NSEntityDescription *timestampEntity = [NSEntityDescription
										   entityForName:@"Timestamp"
										   inManagedObjectContext:self.context];
	
	Timestamp *timestamp = (Timestamp*)[[NSManagedObject alloc]
									initWithEntity:timestampEntity
									insertIntoManagedObjectContext:self.context];
	timestamp.date = [NSDate date];
	//timestamp.color = [UIColor redColor];
	timestamp.color = [UIColor blueColor];
	
	NSError *error = nil;
	BOOL saved = [self.context save:&error];
	if (!saved) {
		NSLog(@"%@", error);
	}
	[self getData];
	[self.tableView reloadData];
}

#pragma  mark - core data

- (void)getData {
	NSEntityDescription *timestampEntity = [NSEntityDescription
											entityForName:@"Timestamp"
											inManagedObjectContext:self.context];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	request.entity = timestampEntity;

	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
										initWithKey:@"date" ascending:NO];
	request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	
	NSArray *results = [self.context executeFetchRequest:request error:nil];
	self.array = results;
}


@end
