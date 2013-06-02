//
//  ESPNHTTPClient.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "AFNetworking.h"

typedef void (^ESPNHTTPClientSuccess)(AFJSONRequestOperation *operation, id responseObject);
typedef void (^ESPNHTTPClientFailure)(AFJSONRequestOperation *operation, NSError *error);

@interface ESPNHTTPClient : AFHTTPClient

+ (instancetype)sharedClient;

- (void)getAthletesForLeague:(NSString *)league parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure;
- (void)getAthletesForLeague:(NSString *)league onTeam:(NSString *)team parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure;
- (void)getAthletesForLeague:(NSString *)league inDivision:(NSString *)division parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure;
- (void)getAthleteWithIdentifer:(NSString *)identifier inLeague:(NSString *)league parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure;
- (void)getAthleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league forYear:(NSString *)year parameters:(NSDictionary *)parameters success:(ESPNHTTPClientSuccess)success failure:(ESPNHTTPClientFailure)failure;

@end
