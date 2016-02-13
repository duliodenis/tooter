//
//  HTTPService.m
//  Tooter
//
//  Created by Dulio Denis on 2/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:8081"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+ (id)sharedInstance {
    static  HTTPService *sharedInstance = nil;
    
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}


- (void)getTutorials:(onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *error;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (error == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt. Please try again.");
            }
        } else {
            NSLog(@"Network Error: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to server.");
        }
        
    }] resume];
}

@end
