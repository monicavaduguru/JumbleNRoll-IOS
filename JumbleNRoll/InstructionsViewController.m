//
//  InstructionsViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "InstructionsViewController.h"
// View controller for the instructions page
@interface InstructionsViewController ()

@end

@implementation InstructionsViewController
@synthesize scrollView,contentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Wood1.png"]]];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = self.contentView.bounds.size;
    [scrollView flashScrollIndicators];
    //[self.scrollView setContentSize:CGSizeMake(320,1000)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidUnload{
    self.scrollView  = nil;
    self.contentView = nil;
    [super viewDidUnload];
}

//function called when home button is pressed
-(IBAction) homePressed
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil] ;
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
