//
//  ESPNAthlete.m
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNAthlete.h"

@implementation ESPNAthlete

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        _firstName = dictionary[@"firstName"];
        _lastName = dictionary[@"lastName"];
        _fullName = dictionary[@"fullName"];
        _displayName = dictionary[@"displayName"];
        _shortName = dictionary[@"shortName"];
        _weight = [dictionary[@"weight"] integerValue];
        _height = [dictionary[@"height"] integerValue];
        _hand = dictionary[@"hand"];
        _jerseyNumber = [dictionary[@"jersey"] stringValue];
        _dateOfBirth = dictionary[@"dateOfBirth"];
        _age = [dictionary[@"age"] integerValue];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, \"%@ %@\">", [self class], self, self.firstName, self.lastName];
}

@end
