//
//  ESPNSampleViewController.m
//  ESPNKit
//
//  Created by Scott Petit on 6/1/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "ESPNSampleViewController.h"
#import "ESPNDataManager.h"
#import "ESPNLeagues.h"
#import "ESPNAthlete.h"

@interface ESPNSampleViewController ()

@end

@implementation ESPNSampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [[ESPNDataManager sharedManager] athleteWithIdentifer:@"3748" inLeague:ESPNLeagueMLB forYear:@"2011" parameters:nil success:^(AFJSONRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
//        
//    }];
    
    [[ESPNDataManager sharedManager] athletesForLeague:ESPNLeagueMensCollegeBasketball inDivision:@"1" withParameters:nil success:^(AFJSONRequestOperation *operation, id responseObject) {
        NSArray *athletesArray = (NSArray *)responseObject;
        
        for (ESPNAthlete *athlete in athletesArray)
        {
            NSLog(@"Athlete - %@", athlete);
        }
        
    } failure:^(AFJSONRequestOperation *operation, NSError *error) {
        //
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
