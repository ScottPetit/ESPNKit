//
//  ESPNTeam.h
//  ESPNKit
//
//  Created by Scott Petit on 6/2/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNObject.h"

@interface ESPNTeam : ESPNObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *location;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *abbreviation;
@property (nonatomic, copy, readonly) NSString *color;

@end
