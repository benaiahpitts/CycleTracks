//
//  OneTimeQuestionsViewController.m
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 12/29/14.
//
//

#import "OneTimeQuestionsViewController.h"
#import "PickerViewDataSource.h"
#import "TravelModePickerViewDataSource.h"
#import "FloridaTripTrackerAppDelegate.h"
#import "User.h"

@interface OneTimeQuestionsViewController ()

@end

@implementation OneTimeQuestionsViewController

@synthesize agePicker, disabledPassSwitch, empFullTimeSwitch, empHomeMakerSwitch, empPartTimeSwitch, empPartYearSwitch, empRetiredSwitch, empSelfEmployedSwitch, empUnemployedSwitch, empWorkAtHomeSwitch, gender, licenseSwitch, studentStatusPicker, studentStatusLabel, studentSwitch, transitPassSwitch, workTripNumber, workTripStepper;
@synthesize scrollView;
@synthesize agePickerDataSource, studentStatusPickerDataSource, test;
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
	
	
	/*[scrollView setFrame:[[UIScreen mainScreen] bounds]];
	CGSize cg;
	UILabel *label= (UILabel *)[self.view viewWithTag:-1];
	cg.height= label.frame.size.height + label.frame.origin.y + 20;
	cg.width= scrollView.frame.size.width;
	[scrollView setContentSize:cg];
	NSLog(@"content height %f, frame height: %f",cg.height,scrollView.frame.size.height);*/
	
	agePickerDataSource= [[PickerViewDataSource alloc] initWithArray:[[NSArray alloc] initWithObjects:@"0-4", @"5-15", @"16-21", @"22-49", @"50-64", @"65 or older", nil]];
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
	
	[empFullTimeSwitch setOn:[[user empFullTime] boolValue]];
	[empHomeMakerSwitch setOn:[[user empHomemaker] boolValue]];
	[empPartYearSwitch setOn:[[user empLess5Months] boolValue]];
	[empPartTimeSwitch setOn:[[user empPartTime] boolValue]];
	[empRetiredSwitch setOn:[[user empRetired] boolValue]];
	[empSelfEmployedSwitch setOn:[[user empSelfEmployed] boolValue]];
	[empUnemployedSwitch setOn:[[user empUnemployed] boolValue]];
	[empWorkAtHomeSwitch setOn:[[user empWorkAtHome] boolValue]];
	[disabledPassSwitch setOn:[[user hasADisabledParkingPass] boolValue]];
	[licenseSwitch setOn:[[user hasADriversLicense] boolValue]];
	[transitPassSwitch setOn:[[user hasATransitPass] boolValue]];
	[studentSwitch setOn:[[user isAStudent] boolValue]];
	
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

- (IBAction)studentSwitchChanged:(id)sender {
	if ([studentSwitch isOn]) {
		[studentStatusLabel setTextColor:[UIColor blackColor]];
		[studentStatusPicker setUserInteractionEnabled:YES];
		PickerViewDataSource *ds= (PickerViewDataSource *)[studentStatusPicker delegate];
		[ds setTextColor:[UIColor blackColor]];
	}
	else {
		[studentStatusLabel setTextColor:[UIColor grayColor]];
		[studentStatusPicker setUserInteractionEnabled:NO];
		PickerViewDataSource *ds= (PickerViewDataSource *)[studentStatusPicker delegate];
		[ds setTextColor:[UIColor grayColor]];
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
		[user setAge:[[agePicker delegate] pickerView:agePicker titleForRow:[agePicker selectedRowInComponent:0] forComponent:0]];
		//value = (expression) ? (if true) : (if false);
		/*[user setEmpFullTime: ([empFullTimeSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpHomemaker: ([empHomeMakerSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpLess5Months: ([empPartYearSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpPartTime: ([empPartTimeSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpRetired: ([empRetiredSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpSelfEmployed: ([empSelfEmployedSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpUnemployed: ([empUnemployedSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setEmpWorkAtHome: ([empWorkAtHomeSwitch isOn]) ? (@"YES") : (@"NO")];*/
		
		[user setGender: ([gender selectedSegmentIndex] == 0) ? (@"M") : (@"F")];
		/*[user setHasADisabledParkingPass: ([disabledPassSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setHasADriversLicense: ([licenseSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setHasATransitPass: ([transitPassSwitch isOn]) ? (@"YES") : (@"NO")];
		[user setIsAStudent: ([studentSwitch isOn]) ? (@"YES") : (@"NO")];*/
		
		[user setNumWorkTrips:[NSNumber numberWithInt:[[workTripNumber text] intValue]]];
		if ([studentSwitch isOn]) {
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
		/*
		if (gender.selectedSegmentIndex == 0) {
			[user setGender:@"M"];
		}
		else
			[user setGender:@"F"];
		*/
		[user setHasADisabledParkingPass:[NSNumber numberWithBool:[disabledPassSwitch isOn]]];
		[user setHasADriversLicense:[NSNumber numberWithBool:[licenseSwitch isOn]]];
		[user setHasATransitPass:[NSNumber numberWithBool:[transitPassSwitch isOn]]];
		[user setIsAStudent:[NSNumber numberWithBool:[studentSwitch isOn]]];
	}
	else
		NSLog(@"SAVE FAIL");
	
	FloridaTripTrackerAppDelegate *delegate= [[UIApplication sharedApplication] delegate];
	[delegate createMainView];
	[managedContext save:nil];
}
@end