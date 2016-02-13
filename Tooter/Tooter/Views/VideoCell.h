//
//  VideoCell.h
//  Tooter
//
//  Created by Dulio Denis on 2/13/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)updateUI:(nonnull Video *)video;
@end
