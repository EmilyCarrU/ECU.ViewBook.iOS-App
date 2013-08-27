//
//  StudentSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "StudentSlideshowViewController.h"

@interface StudentSlideshowViewController ()

@end

@implementation StudentSlideshowViewController

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
    NSArray *students = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"student_slideshow_01"],
                       [UIImage imageNamed:@"student_slideshow_02"],
                       [UIImage imageNamed:@"student_slideshow_03"],
                       [UIImage imageNamed:@"student_slideshow_04"],
                       [UIImage imageNamed:@"student_slideshow_05"],
                       [UIImage imageNamed:@"student_slideshow_06"],
                       [UIImage imageNamed:@"student_slideshow_07"],
                       [UIImage imageNamed:@"student_slideshow_08"],
                       [UIImage imageNamed:@"student_slideshow_09"],
                       [UIImage imageNamed:@"student_slideshow_10"],
                       [UIImage imageNamed:@"student_slideshow_11"],
                       [UIImage imageNamed:@"student_slideshow_12"],
                       [UIImage imageNamed:@"student_slideshow_13"],
                       [UIImage imageNamed:@"student_slideshow_14"],
                       [UIImage imageNamed:@"student_slideshow_15"],
                       [UIImage imageNamed:@"student_slideshow_16"],
                       nil];
    
    // Set ImageView
    [slideshow setAnimationImages:students];
    slideshow.animationDuration = 80.0;
    slideshow.animationRepeatCount = 0;
    [slideshow startAnimating];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
