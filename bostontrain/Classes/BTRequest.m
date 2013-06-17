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


NSString *const baseString = @"http://realtime.mbta.com/developer/api/v1/";
NSString *const scheduleByStop = @"schedulebystop?";
NSString *const stopByLocation = @"stopsbylocation?";

@implementation BTRequest

// return NSData object given parameters
+ (NSData *) getDataWithParams: (NSMutableDictionary *)params baseStringOfURL:(NSString *) baseStringOfURL
{
    NSString *urlStringWithParams = [self getURLStringWithParams:params baseStringOfURL:baseStringOfURL];
    return [urlStringWithParams dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSURL *) getRequestURLWithParams: (NSMutableDictionary *) params baseStringOfURL: (NSString *) baseStringOfURL
{
    
}
@end
