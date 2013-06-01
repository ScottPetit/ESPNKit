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

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *alternateIdentifier;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic) NSInteger weight;
@property (nonatomic) NSInteger height;
@property (nonatomic, copy) NSString *hand;
@property (nonatomic, copy) NSString *jerseyNumber;
@property (nonatomic, copy) NSString *dateOfBirth;
@property (nonatomic) NSInteger age;
@property (nonatomic, copy) NSString *birthCity;
@property (nonatomic, copy) NSString *birthState;
@property (nonatomic, copy) NSString *birthCountry;
@property (nonatomic, strong) ESPNCountry *country;
@property (nonatomic, strong) ESPNSchool *school;
@property (nonatomic) ESPNAthleteStatus athleteStatus;
@property (nonatomic, copy) NSString *atheleteStatusString;
@property (nonatomic) ESPNAthleteInjuryStatus injuryStatus;
@property (nonatomic, copy) NSString *injuryStatusString;

@end
