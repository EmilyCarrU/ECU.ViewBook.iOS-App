//
//  SocialMediaViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SocialMediaViewController.h"

@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(IBAction)facebook:(id)sender {

    NSURL *urlApp = [NSURL URLWithString: [NSString stringWithFormat:@"%@", @"fb://Emily.Carr.University"]];
    if ([[UIApplication sharedApplication] canOpenURL:urlApp]){
        [[UIApplication sharedApplication] openURL:urlApp];
    }else{
        NSURL *url = [ [ NSURL alloc ] initWithString: @"https://www.facebook.com/Emily.Carr.University"];
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (IBAction)twitter:(id)sender {
    NSURL *urlApp = [NSURL URLWithString: [NSString stringWithFormat:@"%@", @"twitter://user?screen_name=EmilyCarrU"]];
    if ([[UIApplication sharedApplication] canOpenURL:urlApp]){
        [[UIApplication sharedApplication] openURL:urlApp];
    }else{
        NSURL *url = [ [ NSURL alloc ] initWithString: @"https://twitter.com/EmilyCarrU" ];
        [[UIApplication sharedApplication] openURL:url];
    }
    
}
- (IBAction)instagram:(id)sender {
    NSURL *urlApp = [NSURL URLWithString:@"instagram://location?id=1"];
    if ([[UIApplication sharedApplication] canOpenURL:urlApp]) {
        [[UIApplication sharedApplication] openURL:urlApp];
    } else {
        NSURL *url = [ [ NSURL alloc ] initWithString: @"http://instagram.com/" ];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
