//
//  WelcomeViewController.m
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 1/14/15.
//
//

#import "WelcomeViewController.h"
#import "OneTimeQuestionsViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

@synthesize textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[textView setText:@"The Survey Department is conducting a travel survey and your help is greatly appreciated.\n\nPlease enter your personal details and use Florida Trip Tracker for 7 consecutive days to track your travel routes.\n\nYour travel information will then be sent to the Trip Tracker Team for use in studies to improve transportation in Florida.\n\nThank you for your participation!"];
	
	[self setTitle:@"Welcome to Florida Trip Tracker App!"];
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

- (IBAction)continueButtonPressed:(id)sender {
	OneTimeQuestionsViewController *vc= [[OneTimeQuestionsViewController alloc] initWithNibName:@"OneTimeQuestionsViewController" bundle:nil];
	
	[[self navigationController] pushViewController:vc animated:YES];
}
@end
