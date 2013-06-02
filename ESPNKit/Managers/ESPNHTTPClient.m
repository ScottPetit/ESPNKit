//
//  ESPNHTTPClient.m
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNHTTPClient.h"
//#warning remove this import
#import "ESPNConstants.h"

//#warning set your API key here
//static NSString * const kESPNAPIKey = @""
static NSString * const kESPNBaseURL = @"http://api.espn.com/";
static NSString * const kESPNAPIVersion = @"v1";

@implementation ESPNHTTPClient

+ (instancetype)sharedClient
{
    static ESPNHTTPClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] init];
    });
    return sharedClient;
}

#pragma mark - Init

- (id)init
{
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/sports", kESPNBaseURL, kESPNAPIVersion]];
    self = [super initWithBaseURL:baseURL];
    if (self)
    {
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setParameterEncoding:AFJSONParameterEncoding];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSMutableDictionary *mutableParameters = [parameters mutableCopy];
    if (mutableParameters)
    {
        [mutableParameters setObject:kESPNAPIKey forKey:@"apikey"];
    }
    else
    {
        mutableParameters = [NSMutableDictionary dictionaryWithObject:kESPNAPIKey forKey:@"apikey"];
    }
    
    return [super requestWithMethod:method path:path parameters:mutableParameters];
}

#pragma mark - Athletes

- (void)getAthletesForLeague:(NSString *)league parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure
{
    NSString *path = [league stringByAppendingString:@"/athletes"];
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)getAthletesForLeague:(NSString *)league onTeam:(NSString *)team parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure
{
    NSString *path = [league stringByAppendingFormat:@"/athletes/team/%@", team];
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)getAthletesForLeague:(NSString *)league inDivision:(NSString *)division parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure
{
    NSString *path = [league stringByAppendingString:@"/athletes"];
    NSMutableDictionary *mutableParameters = [parameters mutableCopy];
    [mutableParameters setObject:division forKey:@"groups"];
    
    [self getPath:path parameters:mutableParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)getAthleteWithIdentifer:(NSString *)identifier inLeague:(NSString *)league parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure
{
    NSString *path = [league stringByAppendingFormat:@"/athletes/%@", identifier];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

- (void)getAthleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league forYear:(NSString *)year parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure
{
    NSString *path = [league stringByAppendingFormat:@"/athletes/%@/dates/%@", identifer, year];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success((AFJSONRequestOperation *)operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure((AFJSONRequestOperation *)operation, error);
        }
    }];
}

@end
