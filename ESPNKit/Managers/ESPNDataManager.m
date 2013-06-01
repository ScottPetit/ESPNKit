//
//  ESPNDataManager.m
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNDataManager.h"

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

@end
