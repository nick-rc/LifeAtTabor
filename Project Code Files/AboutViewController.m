//
//  AboutViewController.m
//  Life At Tabor
//
//  Created by Nick Craig on 4/9/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Implementation of the dismiss about screen view
- (IBAction)dismissAbout:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
