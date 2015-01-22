//
//  TravelModePickerViewDataSource.m
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 12/18/14.
//
//

#import "TravelModePickerViewDataSource.h"

@implementation TravelModePickerViewDataSource

@synthesize travelModes;
@synthesize travelModeBicycle, travelModeCarpool, travelModeOther, travelModePersonalVehicle, travelModePublicTransit, travelModeSchoolBus, travelModeWalk;
@synthesize parent;

- init {
	if ( self = [super init] )
	{
		travelModePersonalVehicle= @"Car, truck, van or motorcycle";
		travelModePublicTransit= @"City/public bus/shuttle - routes, transfers, boarding/alighting locations";
		travelModeSchoolBus= @"School bus";
		travelModeWalk= @"Walk";
		travelModeBicycle= @"Bicycle";
		travelModeCarpool= @"Carpool";
		travelModeOther= @"Other";
		
		travelModes= [[NSMutableArray alloc] initWithObjects:travelModePersonalVehicle, travelModePublicTransit, travelModeSchoolBus, travelModeWalk, travelModeBicycle, travelModeCarpool, travelModeOther, nil];
	}
	return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [travelModes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [travelModes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[parent pickerView:pickerView didSelectRow:row inComponent:component];
}

/*- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	UIView *pickerRowView= [[UIView alloc] initWithFrame:(CGRectMake(0, 0, pickerView.frame.size.width, 100))];
	
	UIImageView *row
	
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
	label.backgroundColor = [UIColor lightGrayColor];
	label.textColor = [UIColor blackColor];
	label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
	label.text = [NSString stringWithFormat:@"  %ld", row+1];
	return label;
	
	return pickerRowView;
}*/

@end
