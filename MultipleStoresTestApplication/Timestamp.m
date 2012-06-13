//
//  Timestamp.m
//  MultipleStoresTestApplication
//
//  Created by Arnaud Coomans on 12/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Timestamp.h"


@implementation Timestamp

@dynamic date;
@dynamic colorData;
@dynamic color;

- (UIColor *)color {
    [self willAccessValueForKey:@"color"];
    UIColor *color = nil;
    NSData *colorData = self.colorData;
	if (colorData != nil) {
		color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
	[self didAccessValueForKey:@"color"];
    return color;
}

- (void)setColor:(UIColor *)aColor {
    [self willChangeValueForKey:@"color"];
    [self setValue:[NSKeyedArchiver archivedDataWithRootObject:aColor]
			forKey:@"colorData"];
    [self didChangeValueForKey:@"color"];
}


@end
