//
//  ViewController.m
//  Tooter
//
//  Created by Dulio Denis on 2/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *videoList;
@end

@implementation ViewController


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the tableView delegates
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.videoList = [[NSArray alloc] init];
    
    [[HTTPService sharedInstance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errorMessage) {
        if (dataArray) {
            NSLog(@"Array: %@", dataArray.debugDescription);
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            // We have an array of dictionaries - enumerate over the JSON Array
            for (NSDictionary *dictionary in dataArray) {
                Video *video = [[Video alloc] init];
                video.title = [dictionary objectForKey:@"title"];
                video.videoDescription = [dictionary objectForKey:@"description"];
                video.iframe = [dictionary objectForKey:@"iframe"];
                video.thumbnailURL = [dictionary objectForKey:@"thumbnail"];
                
                [array addObject:video];
            }
            
            self.videoList = array;
            [self updateTableData];
            
        } else if (errorMessage) {
            // display alert
        }
    }];
}


// convenience method to update tableView on the main thread

- (void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


#pragma mark - TableView Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    
    if (!cell) {
        cell = [[VideoCell alloc] init];
        
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

@end
