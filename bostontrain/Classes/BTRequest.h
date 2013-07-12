//
//  BTRequest.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTRequest : NSOperation

//@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic) id delegate;
@property (nonatomic) SEL succeedSelector;
@property (nonatomic) SEL failSelector;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSMutableDictionary *responseDict;

- (id) initGetRequestWithApi: (id) delegate urlString: (NSString *) urlString succeedSelector: (SEL) succeedSelector failSelector:(SEL) failSelector;

// API calls
+ (id) getArrivalsDeparturesByStopWithDelegate: (id) delegate stopId: (NSString *)stopId route:(NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime succeedSelector: (SEL) succeedSelector;
+ (id) getArrivalsDeparturesByRouteWithDelegate: (id) delegate route: (NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime succeedSelector: (SEL) succeedSelector;
+ (id) getArrivalsDeparturesByTripWithDelegate: (id) delegate trip: (NSString *)trip datetime:(NSString *)datetime succeedSelector: (SEL) succeedSelector;
+ (id) getServerTimeWithDelegate: (id) delegate succeedSelector: (SEL) succeedSelector;
+ (id) getAlertsWithDelegate: (id) delegate succeedSelector: (SEL) succeedSelector;
+ (id) getRouteListWithDelegate: (id) delegate succeedSelector: (SEL) succeedSelector;
+ (id) getStopListByRouteWithDelegate: (id) delegate route: (NSString *) route succeedSelector: (SEL) succeedSelector;
+ (id) getStopListByUserLocationWithDelegate: (id) delegate latitude: (NSString *) latitude longtitude: (NSString *)longitude succeedSelector: (SEL) succeedSelector;

@end
