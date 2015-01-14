//
//  OneTimeQuestionsViewController.h
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 12/29/14.
//
//

#import <UIKit/UIKit.h>
@class PickerViewDataSource;
@class TravelModePickerViewDataSource;

@interface OneTimeQuestionsViewController : UIViewController <UIScrollViewDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property (weak, nonatomic) IBOutlet UIPickerView *agePicker;
@property (weak, nonatomic) IBOutlet UISwitch *empFullTimeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empPartTimeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empPartYearSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empUnemployedSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empRetiredSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empWorkAtHomeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empHomeMakerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *empSelfEmployedSwitch;
@property (weak, nonatomic) IBOutlet UIStepper *workTripStepper;
@property (weak, nonatomic) IBOutlet UILabel *workTripNumber;
@property (weak, nonatomic) IBOutlet UISwitch *studentSwitch;
@property (weak, nonatomic) IBOutlet UILabel *studentStatusLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *studentStatusPicker;
@property (weak, nonatomic) IBOutlet UISwitch *licenseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *transitPassSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *disabledPassSwitch;

@property (nonatomic, strong) PickerViewDataSource *agePickerDataSource;
@property (nonatomic, strong) PickerViewDataSource *studentStatusPickerDataSource;
@property (nonatomic, strong) TravelModePickerViewDataSource *test;

- (IBAction)workTripStepperChanged:(id)sender;
- (IBAction)studentSwitchChanged:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;
@end
