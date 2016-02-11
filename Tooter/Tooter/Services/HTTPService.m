//
//  HTTPService.m
//  Tooter
//
//  Created by Dulio Denis on 2/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "HTTPService.h"

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

@end
