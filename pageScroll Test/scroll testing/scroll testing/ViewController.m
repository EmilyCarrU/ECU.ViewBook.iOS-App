//
//  ViewController.m
//  scroll testing
//
//  Created by Pandita on 2013-08-22.
//  Copyright (c) 2013 Comp3912. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(nonatomic)NSInteger rightSwipeCount; //RX counts the number of swipes
@property(retain,nonatomic)NSMutableArray *array;
@property(weak,nonatomic) NSString *courseName;
@property(weak,nonatomic)NSString *courseDescription;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Path to the plist (in the application bundle)
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"undergrad_courses" ofType:@"plist"];
    // Build the array from the plist
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.textLabel.numberOfLines = 0;
    self.description.lineBreakMode = NSLineBreakByWordWrapping;
    self.description.numberOfLines = 0;
    
    self.textLabel.text=[self getCourses:self.rightSwipeCount course:@"course_name"];
    self.description.text=[self getCourses:self.rightSwipeCount course:@"course_description"];
    
    NSLog(@"Array: %@",self.array);
    
}

- (IBAction)leftSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipping count: %i | array count: %i",self.rightSwipeCount,self.array.count);

    if (self.rightSwipeCount+
        1==self.array.count) {
        self.courseName=[self getCourses:self.rightSwipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.rightSwipeCount course:@"course_description"];
        NSLog(@"swipping left END -> count: %i",self.rightSwipeCount);

    } else if (self.rightSwipeCount<self.array.count) {
        self.rightSwipeCount = self.rightSwipeCount+1;
        self.courseName=[self getCourses:self.rightSwipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.rightSwipeCount course:@"course_description"];
        NSLog(@"swipping left -> count: %i",self.rightSwipeCount);

    }
    self.textLabel.text = self.courseName;
    self.description.text = self.courseDescription;
}
- (IBAction)rightSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipping count: %i | array count: %i",self.rightSwipeCount,self.array.count);
    if (self.rightSwipeCount==0) {
         self.courseName=[self getCourses:self.rightSwipeCount course:@"course_name"];
         self.courseDescription=[self getCourses:self.rightSwipeCount course:@"course_description"];

        NSLog(@"swipping right END -> count: %i",self.rightSwipeCount);
    } else if (self.rightSwipeCount>0) {
        self.rightSwipeCount = self.rightSwipeCount-1;
        self.courseName=[self getCourses:self.rightSwipeCount course:@"course_name"];
        self.courseDescription=[self getCourses:self.rightSwipeCount course:@"course_description"];

        NSLog(@"swipping right -> count: %i",self.rightSwipeCount);
    }

    self.textLabel.text = self.courseName;
    self.description.text = self.courseDescription;
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
