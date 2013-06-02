//
//  ESPNCountry.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNObject.h"

@interface ESPNCountry : ESPNObject

@property (nonatomic, copy, readonly) NSString *identifer;
@property (nonatomic, copy, readonly) NSString *abbreviation;

@end
