//
//  OneTimeQuestionsViewController.h
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 12/29/14.
//
//

#import <UIKit/UIKit.h>
#import "PickerViewDataSourceParent.h"
@class PickerViewDataSource;
@class TravelModePickerViewDataSource;
@class User;

@interface OneTimeQuestionsViewController : UIViewController <UIScrollViewDelegate, PickerViewDataSourceParent, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property (weak, nonatomic) IBOutlet UIPickerView *agePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fullTimeSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *partTimeSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fiveMonthSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unemployedSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *retiredSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *workAtHomeSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *homemakerSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selfEmployedSegment;
@property (weak, nonatomic) IBOutlet UIStepper *workTripStepper;
@property (weak, nonatomic) IBOutlet UILabel *workTripNumber;
@property (weak, nonatomic) IBOutlet UISegmentedControl *studentSegment;
@property (weak, nonatomic) IBOutlet UILabel *studentStatusLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *studentStatusPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *licenseSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *transitPassSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *disabledPassSegment;

@property (nonatomic, strong) PickerViewDataSource *agePickerDataSource;
@property (nonatomic, strong) PickerViewDataSource *studentStatusPickerDataSource;
@property NSManagedObjectContext *managedContext;
@property User *user;

- (IBAction)workTripStepperChanged:(id)sender;
- (IBAction)studentSegmentChanged:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;
@end