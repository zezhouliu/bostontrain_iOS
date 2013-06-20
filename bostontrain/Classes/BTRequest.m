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
NSString *const scheduleByRoute = @"schedulebyroute?";
NSString *const scheduleByTrip = @"schedulebytrip?";
NSString *const stopByLocation = @"stopsbylocation?";
NSString *const serverTime = @"servertime?";
NSString *const routes = @"routes?";
NSString *const routesByStop = @"routesbystop?";
NSString *const stopsByRoute = @"stopsbyroute?";
NSString *const stopsByLocation = @"stopsbylocation?";
NSString *const alerts = @"alerts?";


// Param Strings
NSString *const stopGTFS = @"&stop=";
NSString *const routeGTFS = @"&route=";
NSString *const directionGTFS = @"&direction=";
NSString *const tripGTFS = @"&trip=";
NSString *const epochTime = @"&datetime=";
NSString *const lon = @"&lon=";
NSString *const lat = @"&lat=";

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

// get string of URL for serverTime
// REQUIRED: none
// OPTIONAL: none
- (NSString *) getServerTime
{
    return [NSString stringWithFormat:@"%@%@%@", baseString, serverTime, apiKey];
}

/* * * * * * * * * * *
 * get the alerts
 * REQUIRED: none
 * OPTIONAL: none
 * * * * * * * * * * */
- (NSString *) getAlerts
{
    return [NSString stringWithFormat:@"%@%@%@", baseString, alerts, apiKey];
}

// get route list
// REQUIRED: none
// OPTIONAL: none
- (NSString *) getRouteList
{
    return [NSString stringWithFormat:@"%@%@%@", baseString, routes, apiKey];
}

/* * * * * * * * * * * *
 * get route list by stop
 * REQUIRED: stopId
 * OPTIONAL: none
 * * * * * * * * * * * */
- (NSString *) getRouteByStop: (NSString *) stopId
 {
     if (!stopId){
         return @"";
     }
     
    return [NSString stringWithFormat:@"%@%@%@%@%@", baseString, routesByStop, apiKey, stopGTFS, stopId];
 }
 

/* * * * * * * * * * * *
 * get stop list by route
 * REQUIRED: route
 * OPTIONAL: none
 * * * * * * * * * * * */
- (NSString *) getStopListByRoute: (NSString *) route
{
    if (!route){
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@%@%@%@%@", baseString, stopsByRoute, apiKey, routeGTFS, route];
}

/* * * * * * * * * * * *
 * get route list by stop
 * REQUIRED: latitude, longtitude
 * OPTIONAL: none
 * * * * * * * * * * * */
- (NSString *) getStopListByUserLocation: (NSString *) latitude longtitude: (NSString *)longitude
{
    if (!longitude || !latitude){
        return @"";
    }
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@", baseString, stopsByLocation, apiKey, lat, latitude, lon, longitude];
}

/* * * * * * * * * * * *
 * get scheduled arrivals and departures by stop
 * REQUIRED: stop
 * OPTIONAL: route, direction, datetime
 * * * * * * * * * * * */
- (NSString *) getArrivalsDeparturesWithStop:(NSString *)stopId route:(NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime
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


/* * * * * * * * * * * *
 * get scheduled arrivals and departures by route
 * REQUIRED: route
 * OPTIONAL: direction, datetime
 * * * * * * * * * * * */
- (NSString *) getArrivalsDeparturesWithRoute:(NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime
{
    // stopId is REQUIRED
    if (!route){
        return @"";
    }
    
    // append urlParams if given
    if ([direction length] > 0) {
        direction = [NSString stringWithFormat:@"%@%@", directionGTFS, direction];
    }
    if ([datetime length] > 0) {
        datetime = [NSString stringWithFormat:@"%@%@", epochTime, datetime];
    }
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@", baseString, scheduleByRoute, apiKey, routeGTFS, route, direction, datetime];
    
}

/* * * * * * * * * * * *
 * get scheduled arrivals and departures by trip
 * REQUIRED: route
 * OPTIONAL: datetime
 * * * * * * * * * * * */
- (NSString *) getArrivalsDeparturesWithTrip:(NSString *)trip datetime:(NSString *)datetime
{
    // stopId is REQUIRED
    if (!trip){
        return @"";
    }
    
    // append urlParams if given
    if ([datetime length] > 0) {
        datetime = [NSString stringWithFormat:@"%@%@", epochTime, datetime];
    }
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@", baseString, scheduleByTrip, apiKey, tripGTFS, trip, datetime];
    
}




- (id) init {
    self = [super init];
    if (self) {
        // custom initialization
    }
    
    return self;
}


/* * * * * * * * * *
 * queryURL: Makes an API call with a given URL string
 * REQUIRED: urlString
 * * * * * * * * * */
- (id) queryURL: (NSString *) urlString
{
    
    self.responseData = [NSMutableData data];
        
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog(@"%@", [NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[self.responseData length]);
    
   
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
     NSLog(@"DICTIONARY: %@", res);
    
}

@end
