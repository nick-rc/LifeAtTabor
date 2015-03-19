//
//  SelectDifficultyViewController.m
//  Life At Tabor
//
//  Created by Nick Craig on 4/9/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import "SelectDifficultyViewController.h"
#import "LATVariables.h"


@interface SelectDifficultyViewController ()


@end

@implementation SelectDifficultyViewController

@synthesize HardButton;
@synthesize MedButton;
@synthesize EasyButton;

// Have to initialize the global variables
int difficultylevel;

// Action to dismiss the View Controller
- (IBAction)dismissSelDif:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)difficultySelected:(id)sender{
    if ([sender isEqual:HardButton]){
        difficultylevel = 3;
        NSLog(@"You selected %i",difficultylevel);
    } else if ([sender isEqual:MedButton]){
        difficultylevel = 2;
        NSLog(@"You selected %i",difficultylevel);
    } else if ([sender isEqual:EasyButton]){
        difficultylevel = 1;
        NSLog(@"You selected %i",difficultylevel);
    }
    
}


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


@end
