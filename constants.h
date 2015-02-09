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
//  constants.h
//  CycleTracks
//
//  Copyright 2009-2013 SFCTA. All rights reserved.
//  Written by Matt Paul <mattpaul@mopimp.com> on 8/25/09.
//	For more information on the project, 
//	e-mail Elizabeth Sall at the SFCTA <elizabeth.sall@sfcta.org>


#define kActionSheetButtonConfirm	0
#define kActionSheetButtonChange	1
#define kActionSheetButtonDiscard	2
#define kActionSheetButtonCancel	3

#define kActivityIndicatorSize	20.0

#define kCounterTimeInterval	0.5

#define kCustomButtonWidth		127.0
#define kCustomButtonHeight		42.0

#define kCounterFontSize		26.0
#define kMinimumFontSize		16.0

#define kStdButtonWidth			106.0
#define kStdButtonHeight		40.0

// error messages
#define kConnectionError	@"Unable to reach server"
#define kServerError		@"Failed to upload your trip. Please try again later."

// alert titles
#define kBatteryTitle		@"Battery Low"
#define kRetryTitle			@"Retry Upload?"
#define	kSavingTitle		@"Uploading Your Trip"
#define kSuccessTitle		@"Transfer complete"
#define kTripNotesTitle		@"Enter Comments Below"


#define kInterruptedTitle		@"Recording Interrupted"
#define kInterruptedMessage		@"Oops! Looks like a previous trip recording has been interrupted."
#define kUnsyncedTitle			@"Found Unsynced Trip(s)"
#define kUnsyncedMessage		@"You have at least one saved trip that has not yet been uploaded."
#define kZeroDistanceTitle		@"Recalculate Trip Distance?"
#define kZeroDistanceMessage	@"Your trip distance estimates may need to be recalculated..."

// alert messages
#define kBatteryMessage		@"Recording of your trip has been halted to preserve battery life."
#define kConnecting			@"Contacting server..."
#define kPreparingData		@"Preparing your trip data for transfer."
#define kRetryMessage		@"This trip has not yet been uploaded successfully. Try again?"
#define kSaveSuccess		@"Your trip has been uploaded successfully. Thank you. If you are finished with your trips today, close the app."
#define kSaveAccepted		@"Your trip has already been uploaded. Thank you."
#define kSaveError			@"Your trip has been saved. Please try uploading again later."

#define kInfoURL			@"http://www.aecom.com"
#define kInstructionsURL	@"http://benaiahpitts.github.io/FloridaTripTracker/"

#define kSaveURL			@"https://fdotrts.ursokr.com/TripTracker_WCF_Rest_Service_ursokr/TripTracker.svc/SaveTrip"

#define kTripNotesPlaceholder	@"Comments"

// webservice responses
#define kWebServiceSave			@"Trip data was saved"
#define kWebServiceError		@"Problem saving"
#define kWebServiceErrorAlert	@"Problem saving trip, try again later. Please contact us if the problem persists."

// CustomView metrics used by UIPickerViewDataSource, UIPickerViewDelegate
#define MAIN_FONT_SIZE		18
#define MIN_MAIN_FONT_SIZE	16


/*
 *  System Versioning Preprocessor Macros
 */

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

