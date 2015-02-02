/**  CycleTracks, Copyright 2009-2013 San Francisco County Transportation Authority
 *                                    San Francisco, CA, USA
 *
 *   @author Matt Paul <mattpaul@mopimp.com>
 *
 *   This file is part of CycleTracks.
 *
 *   CycleTracks is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   CycleTracks is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with CycleTracks.  If not, see <http://www.gnu.org/licenses/>.
 */

//
//  TripPurposeDelegate.h
//  CycleTracks
//
//  Copyright 2009-2013 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/22/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth.sall@sfcta.org>


#define kTripPurposeHome		0
#define kTripPurposeWork		1
#define kTripPurposeRecreation	2
#define kTripPurposeShopping	3
#define kTripPurposeSocial		4
#define kTripPurposeMeal		5
#define kTripPurposeSchool		6
#define kTripPurposeCollege		7
#define kTripPurposeDaycare		8
#define kTripPurposeOther		9

#define kTripPurposeHomeIcon		@"other.png"
#define kTripPurposeWorkIcon		@"work-related.png"
#define kTripPurposeRecreationIcon	@"exercise.png"
#define kTripPurposeShoppingIcon	@"shopping.png"
#define kTripPurposeSocialIcon		@"social.png"
#define kTripPurposeMealIcon		@"other.png"
#define kTripPurposeSchoolIcon		@"school.png"
#define kTripPurposeCollegeIcon		@"school.png"
#define kTripPurposeDaycareIcon		@"other.png"
#define kTripPurposeOtherIcon		@"other.png"

#define kTripPurposeHomeString			@"My home"
#define kTripPurposeWorkString			@"My work"
#define kTripPurposeRecreationString	@"Recreation"
#define kTripPurposeShoppingString		@"Shopping/Errands"
#define kTripPurposeSocialString		@"Friend or relative's home"
#define kTripPurposeMealString			@"Meal/Dining Out"
#define kTripPurposeSchoolString		@"School"
#define kTripPurposeCollegeString		@"College"
#define kTripPurposeDaycareString		@"Preschool/Daycare"
#define kTripPurposeOtherString			@"Other"


@protocol TripPurposeDelegate <NSObject>

@required
- (NSString *)getPurposeString:(unsigned int)index;
- (NSString *)setPurpose:(unsigned int)index;

@optional
- (void)didCancelPurpose;
- (void)didPickPurpose:(NSMutableDictionary *)tripAnswers;

@end
