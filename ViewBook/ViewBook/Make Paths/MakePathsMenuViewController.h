//
//  MakePathsMenuViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-31.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakePathsMenuViewController : UIViewController {
    
    // Font
    UIFont *buttonFont;
    
}

// Undergrad Button
@property (weak, nonatomic) IBOutlet UIButton *undergradButton;

// Grad Button
@property (weak, nonatomic) IBOutlet UIButton *graduateButton;

// CS Button
@property (weak, nonatomic) IBOutlet UIButton *csButton;

// Back To Main Menu
- (IBAction)back:(id)sender;

@end
