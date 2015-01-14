//
//  PickerViewDataSource.m
//  FloridaTripTracker
//
//	Basic class for creating data sources for UIPickerView
//
//  Created by Benaiah Pitts on 12/30/14.
//
//

#import "PickerViewDataSource.h"

@implementation PickerViewDataSource

@synthesize dataArray;

- init {
	if ( self = [super init] )
	{
		dataArray= [[NSMutableArray alloc] initWithObjects:@"EMPTY DATA ARRAY", nil];
	}
	return self;
}

- initWithArray:(NSArray *)array {
	if ( self = [super init] )
	{
		dataArray= [[NSMutableArray alloc] initWithArray:array];
	}
	return self;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [dataArray objectAtIndex:row];
}

@end
