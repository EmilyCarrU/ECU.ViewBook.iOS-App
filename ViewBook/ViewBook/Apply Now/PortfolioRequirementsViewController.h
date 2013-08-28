//
//  PortfolioRequirementsViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortfolioRequirementsViewController : UIViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
}

// Page Title
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;
@property (weak, nonatomic) IBOutlet UITextView *mainParagraph;

// Main Paragraph
//@property (weak, nonatomic) IBOutlet UILabel *mainParagraph;


@end
