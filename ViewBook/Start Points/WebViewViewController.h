//
//  WebViewViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController {
    
    //NSString *vimeoURL;
    
}

// Web View
@property (weak, nonatomic) IBOutlet UIWebView *webView;

// URL
@property (strong, nonatomic) NSString *vimeoURL;

// Custom Init
-(id)initWithURL:(NSString*)url;

// Back Button
- (IBAction)sendBackToThumbnails:(id)sender;

@end
