//
//  UnderGraduateViewController.m
//  ViewBook
//
//  Created by Pandita on 2013-08-23.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "UnderGraduateViewController.h"

@interface UnderGraduateViewController ()

@property (copy,nonatomic) NSArray *courses;
@property(nonatomic) NSInteger swipeCount;

@end

@implementation UnderGraduateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //RX initializes array
    self.courses = [[NSArray alloc]init];
    
    //RX load courses from Plist
    NSString *pathForPlist = [[NSBundle mainBundle] pathForResource:@"UndergraduateCourses" ofType:@"plist"];
    self.courses = [NSArray arrayWithContentsOfFile:pathForPlist];
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"LeituraSans-Grot2" size:22];
    paragraphFont = [UIFont fontWithName:@"Leitura Sans" size:18];
    
    // Apply Fonts
    self.courseTitle.font = titleFont;
    self.courseDescription.font = paragraphFont;

    //RX sets the intial course descriptions and titles
    self.swipeCount = 0;
    self.courseTitle.text = self.courses[self.swipeCount];
    self.courseDescription.text = self.courses[self.swipeCount];
	
 
}

- (void)didReceiveMemoryWarning {
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
    if(self.swipeCount < self.courses.count-1){
        self.swipeCount=self.swipeCount+1;
        self.courseTitle.text = self.courses[self.swipeCount];
        
        if (self.swipeCount == 0||self.swipeCount ==4||self.swipeCount ==7||self.swipeCount ==18||self.swipeCount ==20) {
            self.courseDescription.text = self.courses[self.swipeCount];
        } else {
            NSString *fileName = [NSString stringWithFormat:@"BAC%i",self.swipeCount];
            NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
            NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
            self.courseDescription.text = fileContent;
        }
    }
}
- (IBAction)previousCourse:(UISwipeGestureRecognizer *)sender  {
    if(self.swipeCount > 0){
        self.swipeCount=self.swipeCount-1;
        self.courseTitle.text = self.courses[self.swipeCount];
        
        if (self.swipeCount == 0||self.swipeCount ==4||self.swipeCount ==7||self.swipeCount ==18||self.swipeCount ==20) {
            self.courseDescription.text = self.courses[self.swipeCount];
        } else {
            NSString *fileName = [NSString stringWithFormat:@"BAC%i",self.swipeCount];
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
