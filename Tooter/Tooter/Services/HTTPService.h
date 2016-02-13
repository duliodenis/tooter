//
//  HTTPService.h
//  Tooter
//
//  Created by Dulio Denis on 2/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

// Callback Block
typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errorMessage);

@interface HTTPService : NSObject

+ (nullable id) sharedInstance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end
