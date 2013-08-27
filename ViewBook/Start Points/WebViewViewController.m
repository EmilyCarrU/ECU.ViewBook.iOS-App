//
//  WebViewViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "WebViewViewController.h"
#import "VideoThumbnailViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

// Synthesize Variables
@synthesize webView, vimeoURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithURL:(NSString*)url {
    vimeoURL = [[NSString alloc] initWithString:url];
    NSLog(@"The URL received is %@", vimeoURL);
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"VDL");
    
    // Embed the Video
    [self embedVimeo];
    
}

- (IBAction)sendBackToThumbnails:(id)sender {
    
    VideoThumbnailViewController *controller = [[VideoThumbnailViewController alloc] init];

    //UIViewController *initialView = [UIStoryboard instantiateInitialViewController];
    //initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:controller animated:YES completion:NULL];

}

-(void)embedVimeo {
    
    NSString *pre = @"<iframe width=\"300\" height=\"250\" src=\"http://player.vimeo.com/video/";
    NSString *post = @"\" frameborder=\"0\" allowfullscreen></iframe>";
    
    NSString *embedHTML = [NSString stringWithFormat:@"%@%@%@", pre, vimeoURL, post];
    NSLog(@"%@", embedHTML);
    
    [webView loadHTMLString:embedHTML baseURL:nil];
    //[self.view addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
