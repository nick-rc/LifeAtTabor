//
//  GameScreenViewController.h
//  Life At Tabor
//
//  Created by Nick Craig on 4/10/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScreenViewController : UIViewController{
    UISwitch *Toggleswitch; //Button to change info showing
    UIButton *Quitbutton; 
    UIButton *Dice;
    UIButton *Start;
    // Buttons are for the answer selection
    UIButton *choiceA;
    UIButton *choiceB;
    UIButton *choiceC;
    UIButton *choiceD;
    UIButton *dismissCard;
    UIImageView *InfoScreen;
    UIButton *wrongX;
    UIButton *youWin;
    
    IBOutlet UIImageView *gamePiece;
    IBOutlet UIImageView *gameCards;
    
}
@property (nonatomic, retain) IBOutlet UISwitch *ToggleSwitch;
@property (nonatomic, retain) IBOutlet UIButton *Quitbutton;
@property (nonatomic, retain) IBOutlet UIButton *Dice;
@property (nonatomic, retain) IBOutlet UIButton *Start;
@property (nonatomic, retain) IBOutlet UIImageView *InfoScreen;
// Answer Selection Buttons
@property (nonatomic, retain) IBOutlet UIButton *choiceA;
@property (nonatomic, retain) IBOutlet UIButton *choiceB;
@property (nonatomic, retain) IBOutlet UIButton *choiceC;
@property (nonatomic, retain) IBOutlet UIButton *choiceD;
@property (nonatomic, retain) IBOutlet UIButton *dismissCard;
@property (nonatomic, retain) IBOutlet UIButton *wrongX;
@property (nonatomic, retain) IBOutlet UIButton *youWin;



-(IBAction)InfoScreenEnabled:(id)sender;
-(IBAction)QuitPressed;
-(IBAction)DiceRolled;
-(IBAction)Start:(id)sender;
-(IBAction)choiceMade:(id)sender;
-(IBAction)disCard:(id)sender;


@end
