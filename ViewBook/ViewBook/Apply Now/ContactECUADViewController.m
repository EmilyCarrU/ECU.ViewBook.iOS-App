//
//  ContactECUADViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "ContactECUADViewController.h"

@interface ContactECUADViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (strong, nonatomic) IBOutlet UITextField *messageField;

@end

@implementation ContactECUADViewController

// Synthesize Variables

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
    screenIndex = 2;
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"ApplyNowScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    
    // Increase Size Of Message Field
    self.messageField.borderStyle = UITextBorderStyleLine;
    self.messageField.frame = CGRectMake(160, 278, 213, 300);
    self.messageField.borderStyle = UITextBorderStyleRoundedRect;
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)sendEmailBtn:(id)sender {
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            mailer.mailComposeDelegate = self;
            [mailer setSubject:@"Prospective student"];
            NSArray *toRecipients = [NSArray arrayWithObjects:@"tzpandaman@hotmail.com", @"jessecolinscott@gmail.com", nil];
            [mailer setToRecipients:toRecipients];
<<<<<<< HEAD
//            UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
//            NSData *imageData = UIImagePNGRepresentation(myImage);
//            [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
            NSString *nameMessage = [NSString stringWithFormat:@"Name of Prospective Student %@ %@\r", self.firstNameField.text,self.lastNameField.text];
            NSString *questionMessage = [NSString stringWithFormat:@"Message: %@ %@\r", self.question.text, self.phoneField.text];
            NSString *emailBody = [NSString stringWithFormat:@"%@ %@", nameMessage, questionMessage];
            [mailer setMessageBody:emailBody isHTML:NO];
            [self presentModalViewController:mailer animated:YES];
=======
            NSString *nameMessage = [NSString stringWithFormat:@"Name of Prospective Student: %@ %@\r", self.firstNameField.text,self.lastNameField.text];
            NSString *questionMessage = [NSString stringWithFormat:@"Message: %@ %@\r", self.messageField.text, self.phoneField.text];
            NSString *emailBody = [NSString stringWithFormat:@"%@ %@", nameMessage, questionMessage];
            [mailer setMessageBody:emailBody isHTML:NO];
            [self presentViewController:mailer animated:YES completion:nil];
>>>>>>> 7e274adb6178aa681ffbce9b1a0a1e6873653142
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"Your device doesn't have a mail account setup"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
