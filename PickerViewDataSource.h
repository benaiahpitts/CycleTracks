//
//  PickerViewDataSource.h
//  FloridaTripTracker
//
//	Basic class for creating data sources for UIPickerView
//	Assumes there is only one section for the UIPickerView
//
//  Created by Benaiah Pitts on 12/30/14.
//
//

#import <Foundation/Foundation.h>
#import "PickerViewDataSourceParent.h"

@interface PickerViewDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property NSMutableArray *dataArray;
@property UIColor *textColor;
@property id<PickerViewDataSourceParent> parent;

- initWithArray:(NSArray *)array;

@end
