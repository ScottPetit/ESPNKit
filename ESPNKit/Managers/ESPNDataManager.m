//
//  ESPNDataManager.m
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNDataManager.h"
#import "ESPNHTTPClient.h"
#import "ESPNAthlete.h"

@implementation ESPNDataManager

+ (instancetype)sharedManager
{
    static ESPNDataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void)athletesForLeague:(NSString *)league withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure
{
    [[ESPNHTTPClient sharedClient] getAthletesForLeague:league parameters:parameters success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSArray *athletes = [self athletesFromResponse:responseObject];
        
        if (success)
        {
            success(operation, athletes);
        }
        
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        //
    }];
}

- (void)athletesForLeague:(NSString *)league onTeam:(NSString *)team withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure
{
    [[ESPNHTTPClient sharedClient] getAthletesForLeague:league onTeam:team parameters:parameters success:^(AFJSONRequestOperation *operation, id responseObject) {        
        NSArray *athletes = [self athletesFromResponse:responseObject];
        
        if (success)
        {
            success(operation, athletes);
        }
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)athletesForLeague:(NSString *)league inDivision:(NSString *)division withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure
{
    [[ESPNHTTPClient sharedClient] getAthletesForLeague:league inDivision:division parameters:parameters success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSArray *athletes = [self athletesFromResponse:responseObject];
        
        if (success)
        {
            success(operation, athletes);
        }
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)athleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure
{
    [[ESPNHTTPClient sharedClient] getAthleteWithIdentifer:identifer inLeague:league parameters:parameters success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSArray *athletes = [self athletesFromResponse:responseObject];
        ESPNAthlete *athlete = (ESPNAthlete *)athletes[0];
        
        if (success)
        {
            success((AFJSONRequestOperation *)operation, athlete);
        }
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)athleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league forYear:(NSString *)year parameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure
{
    [[ESPNHTTPClient sharedClient] getAthleteWithIdentifer:identifer inLeague:league forYear:year parameters:parameters success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSArray *athletes = [self athletesFromResponse:responseObject];
        ESPNAthlete *athlete = (ESPNAthlete *)athletes[0];
        
        if (success)
        {
            success((AFJSONRequestOperation *)operation, athlete);
        }
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];;
}

#pragma mark - Helpers

- (NSArray *)athletesFromResponse:(id)responseObject
{
    NSDictionary *sportsDictionary = [responseObject[@"sports"] firstObject];
    NSDictionary *leaguesDictionary = [sportsDictionary[@"leagues"] firstObject];
    NSArray *athletesArray = leaguesDictionary[@"athletes"];
    
    NSMutableArray *athletes = [NSMutableArray arrayWithCapacity:athletesArray.count];
    
    for (NSDictionary *athletesDictionary in athletesArray)
    {
        ESPNAthlete *athlete = [ESPNAthlete objectWithDictionary:athletesDictionary];
        [athletes addObject:athlete];
    }
    
    return athletes;
}

@end
