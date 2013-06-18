//
//  BTRequest.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTRequest.h"

NSString *const kHTTP = @"http://";
NSString *const kHTTPS = @"https://";

NSString *const kDeveloperAPIKey = @"api_key=9zoExM5kqUiHeBxFicWOMA";
NSString *const kProductionAPIKey = @"api_key=zrrEkN_21UibjOWgNuvfwg";

// Required strings
NSString *const baseString = @"http://realtime.mbta.com/developer/api/v1/";
NSString *const apiKey = @"api_key=zrrEkN_21UibjOWgNuvfwg";


// Request Strings
NSString *const scheduleByStop = @"schedulebystop?";
NSString *const stopByLocation = @"stopsbylocation?";


// Param Strings
NSString *const stopGTFS = @"&stop=";
NSString *const routeGTFS = @"&route=";
NSString *const directionGTFS = @"&direction=";
NSString *const epochTime = @"&datetime=";

@implementation BTRequest


+ (NSMutableDictionary *) appendBaseURLS:(NSMutableDictionary *) params
{
    if ([[params objectForKey:@"stop"] length] > 0) {
        [params setObject:[NSString stringWithFormat:@"%@%@", stopGTFS, [params objectForKey:@"stop"]] forKey:@"stop"];
    }
    if ([[params objectForKey:@"route"] length] > 0) {
        [params setObject:[NSString stringWithFormat:@"%@%@", routeGTFS, [params objectForKey:@"route"]] forKey:@"route"];
    }
    if ([[params objectForKey:@"direction"] length] > 0) {
        [params setObject:[NSString stringWithFormat:@"%@%@", directionGTFS, [params objectForKey:@"direction"]] forKey:@"direction"];
    }
    if ([[params objectForKey:@"datetime"] length] > 0) {
        [params setObject:[NSString stringWithFormat:@"%@%@", epochTime, [params objectForKey:@"datetime"]] forKey:@"datetime"];
    }
    
    return params;
}

// get string of URL of Arrivals and Departures with stopID
// REQUIRED: stopId
// OPTIONAL: route, direction, datetime
+ (NSString *) getArrivalsDeparturesWithStop:(NSString *)stopId route:(NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime
{
    // stopId is REQUIRED
    if (!stopId){
        return @"";
    }
    
    // append urlParams if given
    if ([route length] > 0) {
        route = [NSString stringWithFormat:@"%@%@", routeGTFS, route];
    }
    if ([direction length] > 0) {
        direction = [NSString stringWithFormat:@"%@%@", directionGTFS, direction];
    }
    if ([datetime length] > 0) {
        datetime = [NSString stringWithFormat:@"%@%@", epochTime, datetime];
    }
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", baseString, scheduleByStop, apiKey, stopGTFS, stopId, route, direction, datetime];
    
}




@end
