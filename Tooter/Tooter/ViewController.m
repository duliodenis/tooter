//
//  ViewController.m
//  Tooter
//
//  Created by Dulio Denis on 2/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService sharedInstance] getTutorials:^(NSDictionary * _Nullable dataDictionary, NSString * _Nullable errorMessage) {
        if (dataDictionary) {
            NSLog(@"Dictionary: %@", dataDictionary.debugDescription);
        } else if (errorMessage) {
            // display alert
        }
    }];
}

@end
