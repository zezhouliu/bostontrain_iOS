//
//  BTJSONParser.h
//  bostontrain
//
//  Created by Alex Liu on 6/16/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTJSONParser : NSObject



// instance methods
- (NSDictionary *) fetchedData:(NSData *)responseData;
- (void) getDataWithAPI:(NSString *) urlString;

@end
