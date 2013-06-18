//
//  BTJSONParser.h
//  bostontrain
//
//  Created by Alex Liu on 6/16/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTJSONParser : NSObject

// properties
@property (nonatomic, strong) NSDictionary *resultDictionary;
@property (nonatomic, strong) NSError *error;

// instance methods
- (void) fetchedData:(NSData *)responseData;

// class methods
- (void) getDataWithAPI:(NSString *) urlString;

@end
