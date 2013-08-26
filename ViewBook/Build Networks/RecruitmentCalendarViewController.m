//
//  RecruitmentCalendarViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "RecruitmentCalendarViewController.h"
#import "CalenderCell.h"


@interface RecruitmentCalendarViewController ()

@end

@implementation RecruitmentCalendarViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eventTimes = [[NSMutableArray alloc]init];
    
    [self.eventTimes addObject:@"Nov 21, 9AM, Montreal"];
    [self.eventTimes addObject:@"Nov 22, 9AM, Boston"];
    [self.eventTimes addObject:@"Nov 22, 2PM, New York"];
    
    for (NSString *date in self.eventTimes) {
        NSLog(@"Array values: %@",date);
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    //RX Creates Calender Cell
    CalenderCell *calenderCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!calenderCell) {
        calenderCell = [[CalenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    calenderCell.textLabel.text = [self.eventTimes objectAtIndex:indexPath.row];
    
    //RX Creates button - tutorial: http://www.youtube.com/watch?v=TADTYkqF6q4
    UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 60, 40)];
    [saveButton addTarget:self action:@selector(savePressed:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setBackgroundColor:[UIColor blackColor]];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];

    [calenderCell addSubview:saveButton];
    [calenderCell setIndentationWidth:5];
    [calenderCell setIndentationLevel:2];
           
    return calenderCell;
}

//RX Button Click action
-(void)savePressed:(UIButton *)sender{
    UITableViewCell *cell = ((UITableViewCell *)[sender superview]);
    NSInteger cellRow = [[self.tableView indexPathForCell:cell] row];
    NSLog(@"Button Number: %i",cellRow);
    [self createLocalNotifications:cell rowNumber:cellRow];
}

//RX Creates multiple Local Notifications 
-(void)createLocalNotifications:(UITableViewCell *)currentCell rowNumber:(NSInteger)rowNumber{
    
    NSString *cellTextLabel = currentCell.textLabel.text;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm a"];    //RX Main Date format
    NSDate *date = [dateFormatter dateFromString:cellTextLabel];
    NSLog(@"date: %@",date);
    

    NSString *message = @"There is an Emily carr Event happening now";

    [self scheduleLocalNotificationWithDate:date: message];
    
}

//RX creates local notification
-(void)scheduleLocalNotificationWithDate:(NSDate *)fireDate :(NSString *)alertMessage{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    notification.fireDate = fireDate;
    notification.alertBody = alertMessage;
//    notification.repeatInterval = NSDayCalendarUnit;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    [self showMessage:@"A Reminder has been set"];
    
}

//RX Creates alert to notify user that notification has been set
- (void)showMessage:(NSString *)bodyTexts{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Reminder"
                                                     message :bodyTexts
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
