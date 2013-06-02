//
//  ESPNTeam.m
//  ESPNKit
//
//  Created by Scott Petit on 6/2/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNTeam.h"

@implementation ESPNTeam

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        _identifier = [dictionary[@"id"] stringValue];
        _location = dictionary[@"location"];
        _name = dictionary[@"name"];
        _abbreviation = dictionary[@"abbreviation"];
        _color = dictionary[@"color"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, \"%@ %@\">", [self class], self, self.location, self.name];
}

@end
