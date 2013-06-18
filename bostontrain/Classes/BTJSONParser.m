//
//  BTJSONParser.m
//  bostontrain
//
//  Created by Alex Liu on 6/16/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTJSONParser.h"


#define BT_REQUEST_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation BTJSONParser


- (void) getDataWithAPI:(NSString *) urlString
{
    dispatch_async(BT_REQUEST_QUEUE, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:urlString]];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
        
    });
    
}

- (void) fetchedData:(NSData *)responseData
{
    NSError *error;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    self.resultDictionary = jsonDictionary;
    NSLog(@"%@", self.resultDictionary);
    self.error = error;
}
@end
