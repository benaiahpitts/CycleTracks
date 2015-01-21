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
//  User.h
//  CycleTracks
//
//  Copyright 2009-2013 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 9/25/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth.sall@sfcta.org>

#import <CoreData/CoreData.h>

@class Trip;

@interface User :  NSManagedObject  
{
}

@property (nonatomic, strong) NSString * age;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString *empFullTime;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empHomemaker;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empLess5Months;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empPartTime;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empRetired;					// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empSelfEmployed;			// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empUnemployed;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *empWorkAtHome;				// is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *studentStatus;
@property (nonatomic, strong) NSString *hasADisabledParkingPass;    // is a boolean "YES":"NO"
@property (nonatomic, strong) NSString *hasADriversLicense;			// is a boolean "YES":"NO"

@property (nonatomic, strong) NSString *hasATransitPass;			// is a boolean "YES":"NO"

@property (nonatomic, strong) NSString *isAStudent;					// is a boolean "YES":"NO"

@property (nonatomic, strong) NSNumber *numWorkTrips;
@property (nonatomic, strong) NSSet* trips;

@end


@interface User (CoreDataGeneratedAccessors)
- (void)addTripsObject:(Trip *)value;
- (void)removeTripsObject:(Trip *)value;
- (void)addTrips:(NSSet *)value;
- (void)removeTrips:(NSSet *)value;

@end

