//
//  BTRequest.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTRequest : NSOperation

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSURLConnection *connection;

- (id) initWithURL: (NSString *) urlString;
+ (NSString *) getArrivalsDeparturesWithStop:(NSString *)stopId route:(NSString *)route direction:(NSString *)direction datetime:(NSString *)datetime;
@end
