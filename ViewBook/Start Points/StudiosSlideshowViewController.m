//
//  StudiosSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "StudiosSlideshowViewController.h"

@interface StudiosSlideshowViewController ()

@end

@implementation StudiosSlideshowViewController

// Synthesize Variables
@synthesize slideshow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // Load Images
    NSArray *studios = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"studios_slideshow_01"],
                             [UIImage imageNamed:@"studios_slideshow_02"],
                             [UIImage imageNamed:@"studios_slideshow_03"],
                             [UIImage imageNamed:@"studios_slideshow_04"],
                             [UIImage imageNamed:@"studios_slideshow_05"],
                             nil];
    
    // Set ImageView
    [slideshow setAnimationImages:studios];
    slideshow.animationDuration = 25.0;
    slideshow.animationRepeatCount = 0;
    [slideshow startAnimating];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
