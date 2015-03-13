//
//  OneTimeQuestionsViewController.m
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 12/29/14.
//
//

#import "constants.h"
#import "OneTimeQuestionsViewController.h"
#import "PickerViewDataSource.h"
#import "TravelModePickerViewDataSource.h"
#import "FloridaTripTrackerAppDelegate.h"
#import "User.h"

@interface OneTimeQuestionsViewController ()

@end

@implementation OneTimeQuestionsViewController

@synthesize agePicker, gender, studentStatusPicker, studentStatusLabel, workTripNumber, workTripStepper, disabledPassSegment, fiveMonthSegment, fullTimeSegment, homemakerSegment, licenseSegment, partTimeSegment, retiredSegment, selfEmployedSegment, studentSegment, transitPassSegment, unemployedSegment, workAtHomeSegment;
@synthesize scrollView;
@synthesize agePickerDataSource, studentStatusPickerDataSource;
@synthesize managedContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self= [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	/*CGSize cg;
	UILabel *label= (UILabel *)[self.view viewWithTag:-1];
	cg.height= label.frame.size.height + label.frame.origin.y + 20;
	cg.width= scrollView.frame.size.width;
	[scrollView setContentSize:cg];
	[scrollView setFrame:[[UIScreen mainScreen] bounds]];
	NSLog(@"init: content height %f, frame height: %f",cg.height,scrollView.frame.size.height);*/
	
	return self;
}

/**/- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	CGSize cg;
	UIView *view= (UIView *)[self.view viewWithTag:-1];
	cg.height= (view.frame.size.height * 6) + view.frame.origin.y + 20;
	cg.width= scrollView.frame.size.width;
	[scrollView setContentSize:cg];
	[scrollView setFrame:[[UIScreen mainScreen] bounds]];
	[[self view] layoutSubviews];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:kLogo]]];
	self.navigationItem.rightBarButtonItem = item;
	
	/*[scrollView setFrame:[[UIScreen mainScreen] bounds]];
	CGSize cg;
	UILabel *label= (UILabel *)[self.view viewWithTag:-1];
	cg.height= label.frame.size.height + label.frame.origin.y + 20;
	cg.width= scrollView.frame.size.width;
	[scrollView setContentSize:cg];
	NSLog(@"content height %f, frame height: %f",cg.height,scrollView.frame.size.height);*/
	
	agePickerDataSource= [[PickerViewDataSource alloc] initWithArray:[[NSArray alloc] initWithObjects:@"0-4", @"5-15", @"16-21", @"22-49", @"50-64", @"65 or older", nil]];
	agePickerDataSource.parent= self;
	agePicker.dataSource= agePickerDataSource;
	agePicker.delegate= agePickerDataSource;
	
	
	studentStatusPickerDataSource= [[PickerViewDataSource alloc] initWithArray:[[NSArray alloc] initWithObjects:@"Daycare", @"Kindergarten", @"Elementary school", @"Middle school", @"High school", @"College/University", nil]];
	
	studentStatusPicker.dataSource= studentStatusPickerDataSource;
	studentStatusPicker.delegate= studentStatusPickerDataSource;
	
	[studentStatusLabel setTextColor:[UIColor grayColor]];
	[studentStatusPicker setUserInteractionEnabled:NO];
	[studentStatusPicker setTintColor:[UIColor whiteColor]];
	
	FloridaTripTrackerAppDelegate *delegate= [[UIApplication sharedApplication] delegate];
	managedContext= [delegate managedObjectContext];


	if ([delegate hasUserInfoBeenSaved]) {
		[self loadUserSettings];
		
		[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
		self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;		
		/*CGSize cg;
		UILabel *label= (UILabel *)[self.view viewWithTag:-1];
		cg.height= label.frame.size.height + label.frame.origin.y + 20;
		cg.width= scrollView.frame.size.width;
		NSLog(@"frame size: %f",cg.height);
		[scrollView setContentSize:cg];*/
	}
	else
		[self setTitle:@"Florida Trip Tracker"];
}

- (void)loadUserSettings {
	User *user= [self getNewOrExistingUser];
	
	[fullTimeSegment setSelectedSegmentIndex:[[user empFullTime] intValue]];
	[homemakerSegment setSelectedSegmentIndex:[[user empHomemaker] intValue]];
	[fiveMonthSegment setSelectedSegmentIndex:[[user empLess5Months]intValue]];
	[partTimeSegment setSelectedSegmentIndex:[[user empPartTime]intValue]];
	[retiredSegment setSelectedSegmentIndex:[[user empRetired]intValue]];
	[selfEmployedSegment setSelectedSegmentIndex:[[user empSelfEmployed]intValue]];
	[unemployedSegment setSelectedSegmentIndex:[[user empUnemployed]intValue]];
	[workAtHomeSegment setSelectedSegmentIndex:[[user empWorkAtHome]intValue]];
	[disabledPassSegment setSelectedSegmentIndex:[[user hasADisabledParkingPass]intValue]];
	[licenseSegment setSelectedSegmentIndex:[[user hasADriversLicense]intValue]];
	[transitPassSegment setSelectedSegmentIndex:[[user hasATransitPass]intValue]];
	[studentSegment setSelectedSegmentIndex:[[user isAStudent]intValue]];
	
	[workTripNumber setText:[[user numWorkTrips] stringValue]];
	
	if ([[user gender] compare:@"M"] == NSOrderedSame) {
		[gender setSelectedSegmentIndex:0];
	}
	else
		[gender setSelectedSegmentIndex:1];
	
	PickerViewDataSource *ageDataSource= (PickerViewDataSource *)[agePicker dataSource];
	for (int i= 0; i < [[ageDataSource dataArray] count]; i++) {
		if ([[user age] compare:[[ageDataSource dataArray] objectAtIndex:i]] == NSOrderedSame) {
			[agePicker selectRow:i inComponent:0 animated:NO];
		}
	}
	
	PickerViewDataSource *studentDataSource= (PickerViewDataSource *)[studentStatusPicker dataSource];
	for (int i= 0; i < [[studentDataSource dataArray] count]; i++) {
		if ([[user age] compare:[[studentDataSource dataArray] objectAtIndex:i]] == NSOrderedSame) {
			[studentStatusPicker selectRow:i inComponent:0 animated:NO];
		}
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)workTripStepperChanged:(id)sender {
	[workTripNumber setText:[NSString stringWithFormat:@"%d",(int)[workTripStepper value]]];
}

- (IBAction)studentSegmentChanged:(id)sender {
	if ([studentSegment selectedSegmentIndex] == 1) {
		[studentStatusLabel setTextColor:[UIColor blackColor]];
		[studentStatusPicker setUserInteractionEnabled:YES];
		PickerViewDataSource *ds= (PickerViewDataSource *)[studentStatusPicker delegate];
		[ds setTextColor:[UIColor whiteColor]];
	}
	else {
		[studentStatusLabel setTextColor:[UIColor grayColor]];
		[studentStatusPicker setUserInteractionEnabled:NO];
		PickerViewDataSource *ds= (PickerViewDataSource *)[studentStatusPicker delegate];
		[ds setTextColor:[UIColor grayColor]];
	}
}

#pragma mark UIPickerViewDelegate


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (pickerView == agePicker) {
		if (row < 2) {
			[fullTimeSegment setSelectedSegmentIndex:0];
			[partTimeSegment setSelectedSegmentIndex:0];
			[fiveMonthSegment setSelectedSegmentIndex:0];
			[unemployedSegment setSelectedSegmentIndex:0];
			[retiredSegment setSelectedSegmentIndex:0];
			[workAtHomeSegment setSelectedSegmentIndex:0];
			[homemakerSegment setSelectedSegmentIndex:0];
			[selfEmployedSegment setSelectedSegmentIndex:0];
			[licenseSegment setSelectedSegmentIndex:0];
			[fullTimeSegment setEnabled:NO];
			[partTimeSegment setEnabled:NO];
			[fiveMonthSegment setEnabled:NO];
			[unemployedSegment setEnabled:NO];
			[retiredSegment setEnabled:NO];
			[workAtHomeSegment setEnabled:NO];
			[homemakerSegment setEnabled:NO];
			[selfEmployedSegment setEnabled:NO];
			[licenseSegment setEnabled:NO];
		}
		
		else {
			[fullTimeSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[partTimeSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[fiveMonthSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[unemployedSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[retiredSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[workAtHomeSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[homemakerSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[selfEmployedSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[licenseSegment setSelectedSegmentIndex:UISegmentedControlNoSegment];
			[fullTimeSegment setEnabled:YES];
			[partTimeSegment setEnabled:YES];
			[fiveMonthSegment setEnabled:YES];
			[unemployedSegment setEnabled:YES];
			[retiredSegment setEnabled:YES];
			[workAtHomeSegment setEnabled:YES];
			[homemakerSegment setEnabled:YES];
			[selfEmployedSegment setEnabled:YES];
			[licenseSegment setEnabled:YES];
		}
	}
}

- (User *)getNewOrExistingUser {
	User *person;
	NSFetchRequest		*request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:managedContext];
	[request setEntity:entity];
	
	NSError *error;
	NSInteger count = [managedContext countForFetchRequest:request error:&error];
	//NSLog(@"saved user count  = %d", count);
	if ( count == 0 )
	{
		// create an empty User entity
		person= [self createUser];
	}
	
	NSMutableArray *mutableFetchResults = [[managedContext executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle the error.
		NSLog(@"no saved user");
		if ( error != nil )
			NSLog(@"OneTimeQuestion saveButtonTapped fetch error %@, %@", error, [error localizedDescription]);
	}
	
	person= [mutableFetchResults objectAtIndex:0];
	
	return person;
}

- (User *)createUser
{
	// Create and configure a new instance of the User entity
	User *noob = (User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:managedContext];
	
	NSError *error;
	if (![managedContext save:&error]) {
		// Handle the error.
		NSLog(@"createUser error %@, %@", error, [error localizedDescription]);
	}
	
	return noob;
}

- (IBAction)saveButtonTapped:(id)sender {
	
	User *user= [self getNewOrExistingUser];
	if ( user != nil )
	{
		NSString *errors= @"";
		
		if ([gender selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select a gender.\n"];
		}
		if ([fullTimeSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you work full-time.\n"];
		}
		if ([partTimeSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you work part-time.\n"];
		}
		if ([fiveMonthSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you work less than 5 months or not.\n"];
		}
		if ([unemployedSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you are unemployed or not.\n"];
		}
		if ([retiredSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you are retired or not.\n"];
		}
		if ([workAtHomeSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you work at home or not.\n"];
		}
		if ([homemakerSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select you are a homemaker or not.\n"];
		}
		if ([selfEmployedSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you are self-employed or not.\n"];
		}
		if ([studentSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you are a student or not.\n"];
		}
		if ([licenseSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you have a personal driver's license or not.\n"];
		}
		if ([transitPassSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you have a transit pass or not.\n"];
		}
		if ([disabledPassSegment selectedSegmentIndex] == UISegmentedControlNoSegment) {
			errors= [errors stringByAppendingString:@"Please select whether you have a disabled parking pass or not.\n"];
		}
		
		if (errors.length == 0) {
			
			[user setAge:[[agePicker delegate] pickerView:agePicker titleForRow:[agePicker selectedRowInComponent:0] forComponent:0]];
			[user setGender: ([gender selectedSegmentIndex] == 0) ? (@"M") : (@"F")];
			[user setNumWorkTrips:[NSNumber numberWithInt:[[workTripNumber text] intValue]]];
			
			[user setEmpFullTime:[NSNumber numberWithInt:(int)[fullTimeSegment selectedSegmentIndex]]];
			[user setEmpHomemaker:[NSNumber numberWithInt:(int)[homemakerSegment selectedSegmentIndex]]];
			[user setEmpLess5Months:[NSNumber numberWithInt:(int)[fiveMonthSegment selectedSegmentIndex]]];
			[user setEmpPartTime:[NSNumber numberWithInt:(int)[partTimeSegment selectedSegmentIndex]]];
			[user setEmpRetired:[NSNumber numberWithInt:(int)[retiredSegment selectedSegmentIndex]]];
			[user setEmpSelfEmployed:[NSNumber numberWithInt:(int)[selfEmployedSegment selectedSegmentIndex]]];
			[user setEmpUnemployed:[NSNumber numberWithInt:(int)[unemployedSegment selectedSegmentIndex]]];
			[user setEmpWorkAtHome:[NSNumber numberWithInt:(int)[workAtHomeSegment selectedSegmentIndex]]];
			[user setHasADisabledParkingPass:[NSNumber numberWithInt:(int)[disabledPassSegment selectedSegmentIndex]]];
			[user setHasADriversLicense:[NSNumber numberWithInt:(int)[licenseSegment selectedSegmentIndex]]];
			[user setHasATransitPass:[NSNumber numberWithInt:(int)[transitPassSegment selectedSegmentIndex]]];
			[user setIsAStudent:[NSNumber numberWithInt:(int)[studentSegment selectedSegmentIndex]]];
			
			if ([studentSegment selectedSegmentIndex] == 1) {
				[user setStudentStatus:[[studentStatusPicker delegate] pickerView:studentStatusPicker titleForRow:[studentStatusPicker selectedRowInComponent:0] forComponent:0]];
			}
			else [user setStudentStatus:@"N/A"];
			
			FloridaTripTrackerAppDelegate *delegate= [[UIApplication sharedApplication] delegate];
			[delegate createMainView];
			[managedContext save:nil];
		}
		
		else {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information!"
															message:errors
														   delegate:self
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
			[alert show];
		}
		//value = (expression) ? (if true) : (if false);
		/*[user setEmpFullTime: ([empFullTimeSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpHomemaker: ([empHomeMakerSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpLess5Months: ([empPartYearSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpPartTime: ([empPartTimeSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpRetired: ([empRetiredSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpSelfEmployed: ([empSelfEmployedSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpUnemployed: ([empUnemployedSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpWorkAtHome: ([empWorkAtHomeSwitch isOn]) ? (@"YES") : (@"NO")];*/
		
		
		/*[user setHasADisabledParkingPass: ([disabledPassSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setHasADriversLicense: ([licenseSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setHasATransitPass: ([transitPassSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setIsAStudent: ([studentSwitch isOn]) ? (@"YES") : (@"NO")];*/
		
		
		/*if ([studentSwitch isOn]) {
			[user setStudentStatus:[[studentStatusPicker delegate] pickerView:studentStatusPicker titleForRow:[studentStatusPicker selectedRowInComponent:0] forComponent:0]];
		}
		else [user setStudentStatus:@"N/A"];
		
		[user setEmpFullTime:[NSNumber numberWithBool:[empFullTimeSwitch isOn]]];
		[user setEmpHomemaker:[NSNumber numberWithBool:[empHomeMakerSwitch isOn]]];
		[user setEmpLess5Months:[NSNumber numberWithBool:[empPartYearSwitch isOn]]];
		[user setEmpPartTime:[NSNumber numberWithBool:[empPartTimeSwitch isOn]]];
		[user setEmpRetired:[NSNumber numberWithBool:[empRetiredSwitch isOn]]];
		[user setEmpSelfEmployed:[NSNumber numberWithBool:[empSelfEmployedSwitch isOn]]];
		[user setEmpUnemployed:[NSNumber numberWithBool:[empUnemployedSwitch isOn]]];
		[user setEmpWorkAtHome:[NSNumber numberWithBool:[empWorkAtHomeSwitch isOn]]];
		[user setHasADisabledParkingPass:[NSNumber numberWithBool:[disabledPassSwitch isOn]]];
		[user setHasADriversLicense:[NSNumber numberWithBool:[licenseSwitch isOn]]];
		[user setHasATransitPass:[NSNumber numberWithBool:[transitPassSwitch isOn]]];
		[user setIsAStudent:[NSNumber numberWithBool:[studentSwitch isOn]]];*/
	}
	else
		NSLog(@"SAVE FAIL");
}
@end