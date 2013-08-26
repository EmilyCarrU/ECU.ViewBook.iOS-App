//
//  ViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SplashViewController.h"
#import "MainMenuViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

// Synthesize Properties
@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Timer
    // RX edtied timer to make loading faster
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(switchView) userInfo:nil repeats:NO];
    }
    
}

// Switch View
- (void) switchView {

    // Segue
    //[self performSegueWithIdentifier:@"timerDone" sender:self];
    
    // Load New Storyboard
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
    
    // Kill Timer
    [timer invalidate];
    self.timer = nil;       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
