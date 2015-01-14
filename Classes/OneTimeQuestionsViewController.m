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

@interface OneTimeQuestionsViewController ()

@end

@implementation OneTimeQuestionsViewController

@synthesize agePicker, disabledPassSwitch, empFullTimeSwitch, empHomeMakerSwitch, empPartTimeSwitch, empPartYearSwitch, empRetiredSwitch, empSelfEmployedSwitch, empUnemployedSwitch, empWorkAtHomeSwitch, gender, licenseSwitch, studentStatusPicker, studentStatusLabel, studentSwitch, workTripNumber, workTripStepper;
@synthesize scrollView;
@synthesize agePickerDataSource, studentStatusPickerDataSource, test;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self= [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	CGSize cg;
	UILabel *label= (UILabel *)[self.view viewWithTag:-1];
	cg.height= label.frame.size.height + label.frame.origin.y + 20;
	cg.width= scrollView.frame.size.width;
	NSLog(@"frame size: %f",cg.height);
	[scrollView setContentSize:cg];
	
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	agePickerDataSource= [[PickerViewDataSource alloc] initWithArray:[[NSArray alloc] initWithObjects:@"0-4", @"5-15", @"16-21", @"22-49", @"50-64", @"65 or older", nil]];
	agePicker.dataSource= agePickerDataSource;
	agePicker.delegate= agePickerDataSource;
	
	
	studentStatusPickerDataSource= [[PickerViewDataSource alloc] initWithArray:[[NSArray alloc] initWithObjects:@"Daycare", @"Kindergarten", @"Elementary school", @"Middle school", @"High school", @"College/University", nil]];
	
	studentStatusPicker.dataSource= studentStatusPickerDataSource;
	studentStatusPicker.delegate= studentStatusPickerDataSource;
	
	[studentStatusLabel setHidden:YES];
	[studentStatusPicker setHidden:YES];
	
	[[self navigationController] setNavigationBarHidden:YES animated:NO];
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
		[studentStatusLabel setHidden:NO];
		[studentStatusPicker setHidden:NO];
	}
	else {
		[studentStatusLabel setHidden:YES];
		[studentStatusPicker setHidden:YES];
	}
}

- (IBAction)saveButtonTapped:(id)sender {
	[[self navigationController] setNavigationBarHidden:NO animated:NO];
	[[self navigationController] popToRootViewControllerAnimated:YES];
}
@end
