//
//  AboutViewController.m
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 3/26/15.
//
//

#import "AboutViewController.h"
#import "constants.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize scrollView, textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	NSString *str= @"Version Number: ";
	
	str= [str stringByAppendingString:[[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"]];
	[textView setText: str];
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

@end
