//
//  FoundationViewController.m
//  ViewBook
//
//  Created by Pandita on 2013-08-29.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "FoundationViewController.h"

@interface FoundationViewController ()

@property (copy,nonatomic) NSArray *courses;
@property(nonatomic) NSInteger swipeCount;

@end

@implementation FoundationViewController

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
    
    NSString *pathForArray = [[NSBundle mainBundle] pathForResource:@"Foundation" ofType:@"plist"];
    self.courses = [NSArray arrayWithContentsOfFile:pathForArray];
    
    self.swipeCount = 1;
    
    //RX sets the intial course descriptions and titles
    self.courseTitle.text = self.courses[self.swipeCount-1];
    
    NSString *fileName = [NSString stringWithFormat:@"FDT%i",self.swipeCount];
    NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
    self.courseDescription.text = fileContent;
	// Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
    UIStoryboard *newStoryboard = [UIStoryboard storyboardWithName:@"MainMenu" bundle:nil];
    UIViewController *initialView = [newStoryboard instantiateInitialViewController];
    initialView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:initialView animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCourseTitle:nil];
    [self setCourseTitle:nil];
    [self setCourseDescription:nil];
    [super viewDidUnload];
}
@end
