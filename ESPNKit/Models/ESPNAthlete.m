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
        self.firstName = dictionary[@"firstName"];
        self.lastName = dictionary[@"lastName"];
        self.fullName = dictionary[@"fullName"];
        self.displayName = dictionary[@"displayName"];
        self.shortName = dictionary[@"shortName"];
        self.weight = [dictionary[@"weight"] integerValue];
        self.height = [dictionary[@"height"] integerValue];
        self.hand = dictionary[@"hand"];
        self.jerseyNumber = [dictionary[@"jersey"] stringValue];
        self.dateOfBirth = dictionary[@"dateOfBirth"];
        self.age = [dictionary[@"age"] integerValue];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, \"%@ %@\">", [self class], self, self.firstName, self.lastName];
}

@end
