//
//  VisitUsViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-29.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "VisitUsViewController.h"

@interface VisitUsViewController ()

@end

@implementation VisitUsViewController

// Synthesize Variables

@synthesize mainParagraph;
@synthesize pageTitle;

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
    
    // Set Screen Index
    screenIndex = 4;
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"Leitura Headline" size:24];
    paragraphFont = [UIFont fontWithName:@"Leitura Sans" size:12];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"ApplyNowScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    pageTitle.font = titleFont;
    
    // Load Text File
    NSString *pathToFile = [[NSBundle mainBundle] pathForResource:@"VisitUs" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Text File To Label
    mainParagraph.text = fileContent;
    mainParagraph.font = paragraphFont;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
