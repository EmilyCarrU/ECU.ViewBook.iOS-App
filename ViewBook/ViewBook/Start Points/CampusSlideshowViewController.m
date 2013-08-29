//
//  CampusSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "CampusSlideshowViewController.h"

@interface CampusSlideshowViewController ()
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic) NSInteger swipeCount;
@property (copy,nonatomic) NSArray *campus;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (copy,nonatomic) NSArray *captionText;

@end

@implementation CampusSlideshowViewController

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
    self.campus = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"campus_slideshow_01"],
                        [UIImage imageNamed:@"campus_slideshow_02"],
                        [UIImage imageNamed:@"campus_slideshow_03"],
                        [UIImage imageNamed:@"campus_slideshow_04"],
                        [UIImage imageNamed:@"campus_slideshow_05"],
                        [UIImage imageNamed:@"campus_slideshow_06"],
                        nil];

    
    self.captionText = [NSArray arrayWithObjects:
                         @"View",
                         @"Ma Trees",
                         @"Ma Condos",
                         @"Ma GFlowers",
                         @"Ma Niggers",
                         @"Ma Dinner",
                        nil];
    
    // Set Gestures and load first image and caption
    self.swipeCount=0;
    [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    self.caption.text=@"Hello";
    self.caption.backgroundColor = [UIColor blueColor];

    
}
- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left swipe");
    if(self.swipeCount < self.campus.count-1){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.campus.count-1);
        self.swipeCount=self.swipeCount+1;
        [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}

- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"right swipe");
    if(self.swipeCount >0){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.campus.count-1);
        self.swipeCount=self.swipeCount-1;
        [slideshow setImage:[self.campus objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
