//
//  MainMenuViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSTimer.h>

@interface MainMenuViewController : UIViewController {
    NSTimer *timer;
}

// Buttons

- (IBAction)loadStartPointsStoryboard:(id)sender;

- (IBAction)loadMakePathsStoryboard:(id)sender;

- (IBAction)loadBuildNetworksStoryboard:(id)sender;

- (IBAction)loadCreateFuturesStoryboard:(id)sender;

- (IBAction)loadApplyNowStoryboard:(id)sender;

@end
