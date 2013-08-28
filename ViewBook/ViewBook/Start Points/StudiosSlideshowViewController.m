//
//  StudiosSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "StudiosSlideshowViewController.h"

@interface StudiosSlideshowViewController ()

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic) NSInteger swipeCount;
@property (copy,nonatomic) NSArray *studios;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (copy,nonatomic) NSArray *captionText;

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
    self.studios = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"studios_slideshow_01"],
                             [UIImage imageNamed:@"studios_slideshow_02"],
                             [UIImage imageNamed:@"studios_slideshow_03"],
                             [UIImage imageNamed:@"studios_slideshow_04"],
                             [UIImage imageNamed:@"studios_slideshow_05"],
                             nil];
    
    self.captionText = [NSArray arrayWithObjects:
                        @"View",
                        @"Ma Trees",
                        @"Ma Condos",
                        @"Ma GFlowers",
                        @"Ma Niggers",
                        nil];
    
    // Set Gestures and load first image and caption
    self.swipeCount=0;
    [slideshow setImage:[self.studios objectAtIndex:self.swipeCount]];
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    self.caption.text=@"Hello";
    self.caption.backgroundColor = [UIColor blueColor];
    // Set ImageView
//    [slideshow setAnimationImages:studios];
//    slideshow.animationDuration = 25.0;
//    slideshow.animationRepeatCount = 0;
//    [slideshow startAnimating];

}
- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left swipe");
    if(self.swipeCount < self.studios.count-1){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.studios.count-1);
        self.swipeCount=self.swipeCount+1;
        [slideshow setImage:[self.studios objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}
- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"right swipe");
    if(self.swipeCount > 0){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.studios.count-1);
        self.swipeCount=self.swipeCount-1;
        [slideshow setImage:[self.studios objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
