//
//  VideoVC.m
//  Tooter
//
//  Created by Dulio Denis on 2/13/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

#import "VideoVC.h"
#import "Video.h"

@interface VideoVC () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation VideoVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    
    self.titleLabel.text = self.video.title;
    self.descriptionLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.iframe baseURL:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // CSS and JS from 2011 StackOverflow Question: UIWebView CSS injection using JavaScript
    // http://stackoverflow.com/questions/6903292/uiwebview-css-injection-using-javascript
    
    NSString *css = @".container { position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }";
    
    NSString *js  = [NSString stringWithFormat:
                     @"var styleNode = document.createElement('style');\n"
                     "styleNode.type = \"text/css\";\n"
                     "var styleText = document.createTextNode('%@');\n"
                     "styleNode.appendChild(styleText);\n"
                     "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}


- (IBAction)commentTapped:(id)sender {
    // Test comment to validate communication to the server
    NSDictionary *comment = @{@"username": @"testUser", @"comment": @"This video is excellent. Seen it twice now!"};
    NSError *error;
    
    // Move this to the HTTPService Class
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://localhost:8081/comments"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:comment options:0 error:&error];
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Server Reply: %@", message);
        } else {
            NSLog(@"No reply from server");
        }
    }];
    
    [postDataTask resume];
}


- (IBAction)doneTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
