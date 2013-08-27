//
//  MainMenuViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"NIB");
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadStartPointsStoryboard:(id)sender {
    
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"StartPoints" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
}

- (IBAction)loadMakePathsStoryboard:(id)sender {
    
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MakePaths" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
}

- (IBAction)loadBuildNetworksStoryboard:(id)sender {
    
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"BuildNetworks" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
}

- (IBAction)loadCreateFuturesStoryboard:(id)sender {
    
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"CreateFutures" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
}

- (IBAction)loadApplyNowStoryboard:(id)sender {
    
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"ApplyNow" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
}
@end
