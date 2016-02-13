//
//  VideoCell.m
//  Tooter
//
//  Created by Dulio Denis on 2/13/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *cellView;
@end


@implementation VideoCell

- (void)awakeFromNib {
    // Styling of the cell
    self.layer.cornerRadius = 3.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

- (void)updateUI:(nonnull Video *)video {
    self.titleLabel.text = video.title;
    self.descriptionLabel.text = video.videoDescription;
    self.thumbnail.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailURL]]];
}

@end
