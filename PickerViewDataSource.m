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

@synthesize dataArray, textColor, parent;

- init {
	if ( self = [super init] )
	{
		dataArray= [[NSMutableArray alloc] initWithObjects:@"EMPTY DATA ARRAY", nil];
		textColor= [UIColor whiteColor];
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

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *title = [dataArray objectAtIndex:row];
	if (textColor == nil) {
		textColor= [UIColor whiteColor];
	}
	NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:textColor}];
	
	return attString;
	
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (parent != nil) {
		[parent pickerView:pickerView didSelectRow:row inComponent:component];
	}
}

@end
