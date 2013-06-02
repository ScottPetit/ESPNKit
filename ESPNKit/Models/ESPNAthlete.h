//
//  ESPNAthlete.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNObject.h"

@class ESPNCountry;
@class ESPNSchool;

typedef NS_ENUM(NSInteger, ESPNAthleteStatus){
    ESPNAthleteStatusActive,
    ESPNAthleteStatusInactive,
    ESPNAthleteStatusDisabled,
    ESPNAthleteStatusMinors,
    ESPNAthleteStatusSuspended,
    ESPNAthleteStatusBereavement,
    ESPNAthleteStatusNotWithTeam,
    ESPNAthleteStatusFreeAgent,
    ESPNAthleteStatusNonRosterInvite
};

typedef NS_ENUM(NSInteger, ESPNAthleteInjuryStatus){
    ESPNAthleteInjuryStatusActive,
    ESPNAthleteInjuryStatusProbable,
    ESPNAthleteInjuryStatusQuestionable,
    ESPNAthleteInjuryStatusDoubtful,
    ESPNAthleteInjuryStatusOut,
    ESPNAthleteInjuryStatusInjuredReserve,
    ESPNAthleteInjuryStatusDayToDay,
    ESPNAthleteInjuryStatus15DayDisabledList,
    ESPNAthleteInjuryStatus60DayDisabledList
};

@interface ESPNAthlete : ESPNObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *alternateIdentifier;
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, copy, readonly) NSString *fullName;
@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *shortName;
@property (nonatomic, readonly) NSInteger weight;
@property (nonatomic, readonly) NSInteger height;
@property (nonatomic, copy, readonly) NSString *hand;
@property (nonatomic, copy, readonly) NSString *jerseyNumber;
@property (nonatomic, copy, readonly) NSString *dateOfBirth;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, copy, readonly) NSString *birthCity;
@property (nonatomic, copy, readonly) NSString *birthState;
@property (nonatomic, copy, readonly) NSString *birthCountry;
@property (nonatomic, strong, readonly) ESPNCountry *country;
@property (nonatomic, strong, readonly) ESPNSchool *school;
@property (nonatomic, readonly) ESPNAthleteStatus athleteStatus;
@property (nonatomic, copy, readonly) NSString *atheleteStatusString;
@property (nonatomic, readonly) ESPNAthleteInjuryStatus injuryStatus;
@property (nonatomic, copy, readonly) NSString *injuryStatusString;

@end
