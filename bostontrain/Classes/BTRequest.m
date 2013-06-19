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

- (id) initWithURL: (NSString *) urlString
{
    self = [super init];
    if (self) {
        
        // custom initalization
        self.responseData = [NSMutableData data];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        
        [request setHTTPMethod:@"GET"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:self.responseData];
        self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        
    }
    
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
