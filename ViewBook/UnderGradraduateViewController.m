//
//  UnderGradraduateViewController.m
//  ViewBook
//
//  Created by Pandita on 2013-08-23.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "UnderGradraduateViewController.h"

@interface UnderGradraduateViewController ()

@property(nonatomic)NSInteger swipeCount; //RX counts the number of swipes
@property(retain,nonatomic)NSMutableArray *array;
@property(weak,nonatomic) NSString *courseName;
@property(weak,nonatomic)NSString *courseDescription;

@end

@implementation UnderGradraduateViewController

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ungrad_courses" ofType:@"plist"];
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    self.courseNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.courseNameLabel.numberOfLines = 0;
    
    self.courseNameLabel.text=[self getCourses:self.swipeCount course:@"course_name"];
    self.courseDescriptionLabel.text=[self getCourses:self.swipeCount course:@"course_description"];
    
    NSLog(@"Array: %@",self.array);

	// Do any additional setup after loading the view.
}


- (IBAction)leftSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipping count: %i | array count: %i",self.swipeCount,self.array.count);
    
    if (self.swipeCount+1==self.array.count) {
//        NSString *pathToFile = [[NSBundle mainBundle] pathForResource:@"ApplicationDirections" ofType:@"txt"];
//        NSString *fileContent = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:NULL];
        self.courseName=[self getCourses:self.swipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.swipeCount course:@"course_description"];
        NSLog(@"swipping left END -> count: %i",self.swipeCount);
        
    } else if (self.swipeCount<self.array.count) {
        self.swipeCount = self.swipeCount+1;
        self.courseName=[self getCourses:self.swipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.swipeCount course:@"course_description"];
        NSLog(@"swipping left -> count: %i",self.swipeCount);
        
    }
    self.courseNameLabel.text = self.courseName;
    NSLog(@"NAME %@", self.courseName);
    self.courseDescriptionLabel.text = self.courseDescription;
}
- (IBAction)rightSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipping count: %i | array count: %i",self.swipeCount,self.array.count);
    if (self.swipeCount==0) {
        self.courseName=[self getCourses:self.swipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.swipeCount course:@"course_description"];
        
        NSLog(@"swipping right END -> count: %i",self.swipeCount);
    } else if (self.swipeCount>0) {
        self.swipeCount = self.swipeCount-1;
        self.courseName=[self getCourses:self.swipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.swipeCount course:@"course_description"];
        
        NSLog(@"swipping right -> count: %i",self.swipeCount);
    }
    
    self.courseNameLabel.text = self.courseName;
    NSLog(@"NAME %@", self.courseName);
    self.courseDescriptionLabel.text = self.courseDescription;
}

-(NSString *)getCourses:(NSInteger)count course:(NSString *)key{
    NSString *result = [[self.array objectAtIndex:count] objectForKey:key];
    return result;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
