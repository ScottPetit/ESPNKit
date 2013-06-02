//
//  ESPNDataManager.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFJSONRequestOperation;

typedef void (^ESPNDataManagerSuccess)(AFJSONRequestOperation *operation, id responseObject);
typedef void (^ESPNDataManagerFailure)(AFJSONRequestOperation *operation, NSError *error);

@interface ESPNDataManager : NSObject

+ (instancetype)sharedManager;

//Athletes
- (void)athletesForLeague:(NSString *)league withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure;
- (void)athletesForLeague:(NSString *)league onTeam:(NSString *)team withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure;
- (void)athletesForLeague:(NSString *)league inDivision:(NSString *)division withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure;
- (void)athleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league withParameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure;
- (void)athleteWithIdentifer:(NSString *)identifer inLeague:(NSString *)league forYear:(NSString *)year parameters:(NSDictionary *)parameters success:(ESPNDataManagerSuccess)success failure:(ESPNDataManagerFailure)failure;

@end
