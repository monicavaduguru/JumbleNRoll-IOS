//
//  BestTimesControllerViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/30/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "BestTimesControllerViewController.h"
#import "Times.h"
// Controller for best times
@interface BestTimesControllerViewController ()

@end

@implementation BestTimesControllerViewController
@synthesize roll3,roll4,roll5,roll6,drag3,drag4,drag5,drag6;

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
    [self set];
    // Do any additional setup after loading the view.
}

//sets the best times for all levels
-(void) set{
    if ([[besttimes.times objectForKey:@"roll3" ] integerValue]<1000)
        [roll3 setText:[besttimes.times objectForKey:@"roll3" ]];
    if ([[besttimes.times objectForKey:@"roll4" ] integerValue]<1000)
        [roll4 setText:[besttimes.times objectForKey:@"roll4" ]];
    if ([[besttimes.times objectForKey:@"roll5" ] integerValue]<1000)
        [roll5 setText:[besttimes.times objectForKey:@"roll5" ]];
    if ([[besttimes.times objectForKey:@"roll6" ] integerValue]<1000)
        [roll6 setText:[besttimes.times objectForKey:@"roll6" ]];
    if ([[besttimes.times objectForKey:@"drag3" ] integerValue]<1000)
        [drag3 setText:[besttimes.times objectForKey:@"drag3" ]];
    if ([[besttimes.times objectForKey:@"drag4" ] integerValue]<1000)
        [drag4 setText:[besttimes.times objectForKey:@"drag4" ]];
    if ([[besttimes.times objectForKey:@"drag5" ] integerValue]<1000)
        [drag5 setText:[besttimes.times objectForKey:@"drag5" ]];
    if ([[besttimes.times objectForKey:@"drag6" ] integerValue]<1000)
        [drag6 setText:[besttimes.times objectForKey:@"drag6" ]];

}
/*
-(IBAction) clear{
    NSArray *keys = [[NSArray alloc] initWithObjects:@"roll3", @"roll4", @"roll5", @"roll6",@"drag3", @"drag4", @"drag5", @"drag6" ,nil];
    NSArray *objs = [[NSArray alloc] initWithObjects:@"1000", @"1000", @"1000",@"1000",@"1000", @"1000", @"1000",@"1000", nil];
    NSDictionary *time = [[NSDictionary alloc] initWithObjects:objs forKeys:keys];
    besttimes.times=[NSMutableDictionary dictionaryWithDictionary:time];
    [besttimes savePersistentData];
    
    [roll3 setText:@"N/a"];
    [roll4 setText:@"N/a"];
    [roll5 setText:@"N/a"];
    [roll6 setText:@"N/a"];
    [drag3 setText:@"N/a"];
    [drag4 setText:@"N/a"];
    [drag5 setText:@"N/a"];
    [drag6 setText:@"N/a"];


}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//function called when home pressed
-(IBAction) homePressed
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil] ;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//Ensures no autorotaion
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
