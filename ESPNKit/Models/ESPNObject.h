//
//  ESPNObject.h
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESPNObject : NSObject

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
