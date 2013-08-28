//
//  StudentSlideshowViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "StudentSlideshowViewController.h"

@interface StudentSlideshowViewController ()
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic) NSInteger swipeCount;
@property (copy,nonatomic) NSArray *students;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (copy,nonatomic) NSArray *captionText;

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
     self.students = [NSArray arrayWithObjects:
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
    
    self.captionText = [NSArray arrayWithObjects:
                        @"View",
                        @"Ma Trees",
                        @"Ma Condos",
                        @"Ma GFlowers",
                        @"Ma Niggers",
                        @"Ma Dinner",
                        @"View",
                        @"Ma Trees",
                        @"Ma Condos",
                        @"Ma GFlowers",
                        @"Ma Niggers",
                        @"Ma Dinner",
                        @"View",
                        @"Ma Trees",
                        @"Ma Condos",
                        @"Ma GFlowers",
                        @"Ma Niggers",
                        @"Ma Dinner",
                        @"View",
                        @"Ma Trees",
                        @"Ma Condos",
                        nil];
    
    
    // Set Gestures and load first image and caption
    self.swipeCount=0;
    [slideshow setImage:[self.students objectAtIndex:self.swipeCount]];
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    self.caption.text=@"Hello";
    self.caption.backgroundColor = [UIColor blueColor];
    // Set ImageView
//    [slideshow setAnimationImages:students];
//    slideshow.animationDuration = 80.0;
//    slideshow.animationRepeatCount = 0;
//    [slideshow startAnimating];
    
}
- (IBAction)previousImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left swipe");
    if(self.swipeCount < self.students.count-1){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.students.count-1);
        self.swipeCount=self.swipeCount+1;
        [slideshow setImage:[self.students objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}

- (IBAction)nextImage:(UISwipeGestureRecognizer *)sender {
    NSLog(@"right swipe");
    if(self.swipeCount > 0){
        NSLog(@"swipe count: %i  |*| array count: %i",self.swipeCount,self.students.count-1);
        self.swipeCount=self.swipeCount-1;
        [slideshow setImage:[self.students objectAtIndex:self.swipeCount]];
        self.caption.text = [self.captionText objectAtIndex:self.swipeCount];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
