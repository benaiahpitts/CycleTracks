//
//  AboutViewController.h
//  FloridaTripTracker
//
//  Created by Benaiah Pitts on 3/26/15.
//
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
