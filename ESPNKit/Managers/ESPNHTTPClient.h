//
//  ESPNHTTPClient.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "AFNetworking.h"

@interface ESPNHTTPClient : AFHTTPClient

+ (instancetype)sharedClient;

@end
