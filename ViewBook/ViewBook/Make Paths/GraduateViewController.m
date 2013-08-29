//
//  GraduateViewController.m
//  ViewBook
//
//  Created by Pandita on 2013-08-29.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "GraduateViewController.h"

@interface GraduateViewController ()

@property (copy,nonatomic) NSArray *courses;
@property(nonatomic) NSInteger swipeCount;

@end

@implementation GraduateViewController


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
    self.courses = [[NSArray alloc]init];
    //RX load courses from Plist
    NSString *pathForArray = [[NSBundle mainBundle] pathForResource:@"GraduateCourses" ofType:@"plist"];
    self.courses = [NSArray arrayWithContentsOfFile:pathForArray];

    self.swipeCount = 0;
    
    //RX sets the intial course descriptions and titles
    self.courseTitle.text = self.courses[self.swipeCount];
    self.courseDescription.text = self.courses[self.swipeCount];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//RX back button to main menu
- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

//changes plist course title on swiping
- (IBAction)nextCourse:(UISwipeGestureRecognizer *)sender  {
    NSLog(@"left swipe");
    if(self.swipeCount < self.courses.count-1){
        self.swipeCount=self.swipeCount+1;
        self.courseTitle.text = self.courses[self.swipeCount];
        
        if (self.swipeCount == 0) {
            self.courseDescription.text = self.courses[self.swipeCount];
        } else {
            NSString *fileName = [NSString stringWithFormat:@"GRA%i",self.swipeCount];
            NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
            self.courseDescription.text = fileContent;
        }
    }
}
- (IBAction)previousCourse:(UISwipeGestureRecognizer *)sender  {
    NSLog(@"right swipe");
    if(self.swipeCount > 0){
        self.swipeCount=self.swipeCount-1;
        self.courseTitle.text = self.courses[self.swipeCount];
        
        if (self.swipeCount == 0) {
            self.courseDescription.text = self.courses[self.swipeCount];
        } else {
            NSString *fileName = [NSString stringWithFormat:@"GRA%i",self.swipeCount];
            NSLog(@"Grad: %@",fileName);
            NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
            self.courseDescription.text = fileContent;
        }
    }
}

- (void)viewDidUnload {
    [self setCourseTitle:nil];
    [self setCourseDescription:nil];
    [super viewDidUnload];
}
@end
