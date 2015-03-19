//
//  GameScreenViewController.m
//  Life At Tabor
//
//  Created by Nick Craig on 4/10/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import "GameScreenViewController.h"
#import "LATVariables.h"


@interface GameScreenViewController ()

@end

@implementation GameScreenViewController

@synthesize ToggleSwitch;
@synthesize dismissCard;
@synthesize Quitbutton;
@synthesize InfoScreen;
@synthesize Dice;
@synthesize Start;

@synthesize choiceA;
@synthesize choiceB;
@synthesize choiceC;
@synthesize choiceD;

@synthesize wrongX;
@synthesize youWin;

int dicevalue;
int currentCoord/*Current Coordinate Value of Game Piece*/;
int choices;
int moveon;
int trivNum;
int scardNum;
int dcardNum;



-(IBAction)Start:(id)sender{
    // Start Button creates the UIImage view and displays the icon on screen
    NSArray * gamepieceArray = [NSArray arrayWithObjects:@"Seawolf.png", @"Schooner.png", @"Letters.png", @"Flag.png", @"Seal.png", nil];
    
    UIImage *gameIcon = [UIImage imageNamed:gamepieceArray[charactervalue]];
    [gamePiece setImage:gameIcon];
    
    Start.hidden = YES;
    /*
     Create all of the Trivia and Card Objects
     
     
     */
}
// The following code uses the toggel button to hide the info screen and show the dice when toggled
-(IBAction)InfoScreenEnabled:(id)sender{
    if ([sender selectedSegmentIndex] == 0) {
        Quitbutton.hidden = NO;
        InfoScreen.hidden = NO;
        Dice.hidden = YES;
    }
    else{
        Quitbutton.hidden = YES;
        InfoScreen.hidden = YES;
        Dice.hidden = NO;
    }
    
}
// Directs the screen to the original UIViewCOntroller of the Game
-(IBAction)QuitPressed{
    // This code makes the screen go back to the original view
    [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    currentCoord = 0;
    trivNum = 0;
    scardNum = 0;
    dcardNum = 0;
    // Need to include code to cancel any values that have been created through the first two screens
}
// Starts/Continues the moves of the game


-(IBAction)DiceRolled{
    int intermediateDval;
    // array with the tile X coordinates
    float xCoords[167] = {76.5, 100.5, 124.5, 148.5, 172.5,
        196.5, 220.5, 244.5, 268.5, 292.5,
        316.5, 340.5, 364.5, 388.5, 412.5,
        436.5, 460.5, 484.5, 508.5, 531.5,/*up right*/
        531.5, 531.5, 531.5, 531.5, 531.5,
        531.5, 531.5, 531.5, 531.5, 531.5,
        531.5,/* start top row */ 508, 483.25, 458.5, 433.75,
        409, 384.25, 359.5, 334.75, 310,
        285.25, 260.5, 235.75, 211, 186.25,
        161.5, 136.75, 112, 87.25, 62.5,
        37.75, 14/* down left*/, 14, 14, 14,
        14, 14, 14, 14, 14,
        14, 14/*2nd bottom*/, 37, 60, 83,
        106, 129, 152, 175, 198,
        221, 244, 267, 290, 313,
        336, 359, 382, 405, 428,
        452, 476, 500,/*2nd Right*/500, 500,
        500, 500, 500, 500, 500,
        500, 500, /*2nd top*/476, 452, 428,
        404, 380, 356, 332, 308,
        284, 260, 236, 212, 188,
        164, 140, 116, 92, 69,
        45.5, /*2nd left*/ 45.5, 45.5, 45.5, 45.5,
        45.5, 45.5, 45.5,/*3rd bottom*/69, 92.5,
        116, 139.5, 163, 186.5, 210,
        233.5, 257, 280.5, 304, 327.5,
        351, 374.5, 398, 421.5, 445.25,
        470, /*3rd right*/ 470, 470, 470, 470,
        470, 470, /*3rd top*/445.5, 421, 396.5,
        372, 347.5, 323, 298.5, 274,
        249.5, 225, 200.5, 176, 151.5,
        127, 102.5, 77.5,/*3rd left*/ 77.5, 77.5,
        77.5, 77.5, 77.5, /*4th bottom*/100.5, 123.5,
        146.5, 169.5};
    // array with the Y coordinates
    float yCoords[167] = {282, 282, 282, 282, 282,
        282, 282, 282, 282, 282,
        282, 282, 282, 282, 282,
        282, 282, 282, 282, 282,/*up right*/
        257.5, 233, 208.5, 184, 159.5,
        135, 110.5, 86, 61.5, 37,
        12,/* start top row */ 12, 12, 12, 12,
        12, 12, 12, 12, 12,
        12, 12, 12, 12, 12,
        12, 12, 12, 12, 12,
        12, 12/*downleft*/, 35.75, 59.5, 83.25,
        107, 130.75, 154.5, 178.25, 202,
        225.75, 249.5/* 2nd bottom */, 249.5, 249.5, 249.5,
        249.5, 249.5, 249.5, 249.5, 249.5,
        249.5, 249.5, 249.5, 249.5, 249.5,
        249.5, 249.5, 249.5, 249.5, 249.5,
        249.5, 249.5, 249.5, 226.5, 203.5,
        180.5, 157.5, 134.5, 111.5, 88.5,
        65.5, 42.5, /*2nd top*/42.5, 42.5, 42.5,
        42.5, 42.5, 42.5, 42.5, 42.5,
        42.5, 42.5, 42.5, 42.5, 42.5,
        42.5, 42.5, 42.5, 42.5, 42.5,
        42.5, /*2nd left*/68, 93, 118, 143,
        168, 194, 220, /*3rd bottom*/220, 220,
        220, 220, 220, 220, 220,
        220, 220, 220, 220, 220,
        220, 220, 220, 220, 220,
        220, /*3rd right*/195.5, 171, 146.5, 122,
        97.5, 72.5, /*3rd top*/72.5, 72.5, 72.5,
        72.5, 72.5, 72.5, 72.5, 72.5,
        72.5, 72.5, 72.5, 72.5, 72.5,
        72.5, 72.5, 72.5,/*3rd left*/96, 119.5,
        143, 166.5, 190, /*4th bottom*/190, 190,
        190, 190};
    /* Game Piece Array
     NSArray * gamepieceArray = [NSArray arrayWithObjects:@"Seawolf.png", @"Schooner.png", @"Letters.png", @"Flag.png", @"Seal.png", nil];
     */
    // Random Dice Value
    intermediateDval = (arc4random() % 6) + 1;
    dicevalue = intermediateDval;
    currentCoord = currentCoord + dicevalue;
    // NSLog(@"You rolled a %i, Now at Coord: %i", dicevalue, currentCoord);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    // Win Sequence
    if (currentCoord >= 166) {
        NSLog(@"You win!");
        
        CGPoint center = [gamePiece center];
        center.x = (180);
        center.y = (201.25);
        [gamePiece setCenter:center];
        
        youWin.hidden = NO;
        
        moveon = 0;
        
        while (moveon == 0)
        {   // This code causes the program to pause while it waits for a user interaction
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
        }
        
        [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
        
    }
    
    /*
    CGRect rect = [gamePiece frame];
    rect.size.width = 50;
    rect.size.height = 60;
    [gamePiece setFrame:rect];
    */
    
    // Following Code moves the game piece around the ,board
    CGPoint center = [gamePiece center];
    center.x = (xCoords[currentCoord] + 11.25);
    center.y = (yCoords[currentCoord] + 11.25);
    [gamePiece setCenter:center];
    
    // Open Cards based on difficulty
    switch (difficultylevel) {
        case 1:
            //Easy Code
            // IF Scholars is landed on
            if (currentCoord == 4 || currentCoord == 3 || currentCoord == 12 || currentCoord == 11 || currentCoord == 19 || currentCoord == 20 || currentCoord == 28 || currentCoord == 27 || currentCoord == 36 || currentCoord == 35 || currentCoord == 44 || currentCoord == 43 || currentCoord == 52 || currentCoord == 51 || currentCoord == 60 || currentCoord == 59 || currentCoord == 68 || currentCoord == 67 || currentCoord == 76 || currentCoord == 75 || currentCoord == 84 || currentCoord == 83 || currentCoord == 92 || currentCoord == 91 || currentCoord == 100 || currentCoord == 99 || currentCoord == 108 || currentCoord == 107 || currentCoord == 116 || currentCoord == 115 || currentCoord == 124 || currentCoord == 123 || currentCoord == 132 || currentCoord == 131 || currentCoord == 140 || currentCoord == 139 || currentCoord == 148 || currentCoord == 147 || currentCoord == 156 || currentCoord == 155 || currentCoord == 164 || currentCoord == 163){
                NSLog(@"Blue: Scholar's");
                NSArray * sCardArray = [NSArray arrayWithObjects:@"SCard1", @"SCard2", @"SCard3", @"SCard4", @"SCard5", @"SCard6", @"SCard7", @"SCard8", @"SCard9", @"SCard10", nil];
                
                int sSpaceArray[10] = {2, 3, 2, 1, 2, 1, 2, 3, 2, 1};
                // Card number will serve the same purpose as Triv Num
                scardNum = arc4random() % 10;
                
                
                gameCards.hidden = NO;
                Dice.hidden = YES;
                    
                UIImage *card1 = [UIImage imageNamed:sCardArray[scardNum]];
                [gameCards setImage:card1];
                    
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
               
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                dismissCard.hidden = NO;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                    
                    
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                    
                currentCoord = currentCoord + sSpaceArray[scardNum];
                    
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
                    
                }
            
            // If Easy Trivia is landed on
            if(currentCoord == 1 || currentCoord == 6 || currentCoord == 9 || currentCoord == 14 || currentCoord == 17 || currentCoord == 22 || currentCoord == 25 || currentCoord == 30 || currentCoord == 33 || currentCoord == 38 || currentCoord == 41 || currentCoord == 46 || currentCoord == 49 || currentCoord == 54 || currentCoord == 57 || currentCoord == 62 || currentCoord == 65 || currentCoord == 70 || currentCoord == 73 || currentCoord == 78 || currentCoord == 81 || currentCoord == 86 || currentCoord == 89 || currentCoord == 94 || currentCoord == 97 || currentCoord == 102 || currentCoord == 105 || currentCoord == 110 || currentCoord == 113 || currentCoord == 118 || currentCoord == 121 || currentCoord == 126 || currentCoord == 129 || currentCoord == 134 || currentCoord == 137 || currentCoord == 142 || currentCoord == 145 || currentCoord == 150 || currentCoord == 153 || currentCoord == 158 || currentCoord == 161 || currentCoord == 166){
                NSArray * eTrivArray = [NSArray arrayWithObjects:@"ETriv1.png", @"ETriv2.png", @"ETriv3.png", @"ETriv4.png", @"ETriv5.png", @"ETriv6.png", @"ETriv7.png", @"ETriv8.png", @"ETriv9.png", @"ETriv10.png", @"ETriv11.png", @"ETriv12.png", @"ETriv13.png", @"ETriv14.png", @"ETriv15.png", @"ETriv16.png", @"ETriv17.png", @"ETriv18.png", @"ETriv19.png", @"ETriv20.png", nil];
                int eAnsArray[20] = {1, 3, 4, 1, 2, 3, 2, 4, 1, 3, 4, 2, 3, 3, 1, 1, 4, 2, 1, 4};
                
                trivNum = arc4random() % 20;
                
                UIImage *card1 = [UIImage imageNamed:eTrivArray[trivNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (284);
                center.y = (160);
                [gameCards setCenter:center];
                
                choiceA.hidden = NO;
                choiceB.hidden = NO;
                choiceC.hidden = NO;
                choiceD.hidden = NO;
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                // This if statement responds to a correct guess
                if (choices == eAnsArray[trivNum]) {
                    currentCoord = currentCoord + 2;
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    Dice.hidden = NO;
                }else{
                    // Show wrong button
                    
                    wrongX.hidden = NO;
                    moveon = 0;
                    
                    while (moveon == 0)
                    {   // This code causes the program to pause while it waits for a user interaction
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                    }
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    wrongX.hidden = YES;
                    Dice.hidden = NO;
                    
                    if(currentCoord <= 2){
                        currentCoord = currentCoord - 1;
                    }else
                        currentCoord = currentCoord - 2;
                    
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    
                }
                
                
                
                
                
            }
            
            // If Dean's Card is Landed on
            if (currentCoord == 2 || currentCoord == 5 || currentCoord == 10 || currentCoord == 13 || currentCoord == 18 || currentCoord == 21 || currentCoord == 26 || currentCoord == 29 || currentCoord == 34 || currentCoord == 37 || currentCoord == 42 || currentCoord == 45 || currentCoord == 50 || currentCoord == 53 || currentCoord == 58 || currentCoord == 61 || currentCoord == 66 || currentCoord == 69 || currentCoord == 74 || currentCoord == 77 || currentCoord == 82 || currentCoord == 85 || currentCoord == 90 || currentCoord == 93 || currentCoord == 98 || currentCoord == 101 || currentCoord == 106 || currentCoord == 109 || currentCoord == 114 || currentCoord == 117 || currentCoord == 122 || currentCoord == 125 || currentCoord == 130 || currentCoord == 133 || currentCoord == 138 || currentCoord == 141 || currentCoord == 146 || currentCoord == 149 || currentCoord == 154 || currentCoord == 157 || currentCoord == 162 || currentCoord == 165) {
                NSLog(@"Orange: Dean's Card");
                NSArray * dCardArray = [NSArray arrayWithObjects:@"DCard1",@"DCard2", @"DCard3", @"DCard4", @"DCard5", @"DCard6", @"DCard7", @"DCard8", @"DCard9", @"DCard10", nil];
                
                int dSpaceArray[10] = {1, 2, 2, 2, 1, 1, 2, 3, 1, 2};
                // Card number will serve the same purpose as Triv Num
                dcardNum = arc4random() % 10;
                
                gameCards.hidden = NO;
                dismissCard.hidden = NO;
                Dice.hidden = YES;
                
                UIImage *card1 = [UIImage imageNamed:dCardArray[dcardNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                
                
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                
                currentCoord = currentCoord - dSpaceArray[dcardNum];
                
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
            }

            break;
        case 2:
            //Medium Code
            // Blue: Scholar's Card
            if (currentCoord == 1 || currentCoord == 8 || currentCoord == 11 || currentCoord == 18 || currentCoord == 21 || currentCoord == 28 || currentCoord == 31 || currentCoord == 38 || currentCoord == 41 || currentCoord == 48 || currentCoord == 51 || currentCoord == 58 || currentCoord == 61 || currentCoord == 68 || currentCoord == 71 || currentCoord == 78 || currentCoord == 81 || currentCoord == 88 || currentCoord == 91 || currentCoord == 98 || currentCoord == 101 || currentCoord == 108 || currentCoord == 111 || currentCoord == 118 || currentCoord == 121 || currentCoord == 128 || currentCoord == 131 || currentCoord == 138 || currentCoord == 141 || currentCoord == 148 || currentCoord == 151 || currentCoord == 158 || currentCoord == 161){
                NSLog(@"Blue: Scholar's");
                NSArray * sCardArray = [NSArray arrayWithObjects:@"SCard1", @"SCard2", @"SCard3", @"SCard4", @"SCard5", @"SCard6", @"SCard7", @"SCard8", @"SCard9", @"SCard10", nil];
                
                int sSpaceArray[10] = {2, 3, 2, 1, 2, 1, 2, 3, 2, 1};
                // Card number will serve the same purpose as Triv Num
                scardNum = arc4random() % 10;
                
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                UIImage *card1 = [UIImage imageNamed:sCardArray[scardNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                dismissCard.hidden = NO;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                
                
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                
                currentCoord = currentCoord + sSpaceArray[scardNum];
                
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
                
            }
            // Green: Easy Trivia
            if (currentCoord == 2 || currentCoord == 7 || currentCoord == 12 || currentCoord == 17 || currentCoord == 22 || currentCoord == 27 || currentCoord == 32 || currentCoord == 37 || currentCoord == 42 || currentCoord == 47 || currentCoord == 52 || currentCoord == 57 || currentCoord == 62 || currentCoord == 67 || currentCoord == 72 || currentCoord == 77 || currentCoord == 82 || currentCoord == 87 || currentCoord == 92 || currentCoord == 97 || currentCoord == 102 || currentCoord == 107 || currentCoord == 112 || currentCoord == 117 || currentCoord == 122 || currentCoord == 127 || currentCoord == 132 || currentCoord == 137 || currentCoord == 142 || currentCoord == 147 || currentCoord == 152 || currentCoord == 157 || currentCoord == 162 || currentCoord == 167){
                NSArray * eTrivArray = [NSArray arrayWithObjects:@"ETriv1.png", @"ETriv2.png", @"ETriv3.png", @"ETriv4.png", @"ETriv5.png", @"ETriv6.png", @"ETriv7.png", @"ETriv8.png", @"ETriv9.png", @"ETriv10.png", @"ETriv11.png", @"ETriv12.png", @"ETriv13.png", @"ETriv14.png", @"ETriv15.png", @"ETriv16.png", @"ETriv17.png", @"ETriv18.png", @"ETriv19.png", @"ETriv20.png", nil];
                int eAnsArray[20] = {1, 3, 4, 1, 2, 3, 2, 4, 1, 3, 4, 2, 3, 3, 1, 1, 4, 2, 1, 4};
                
                trivNum = arc4random() % 20;
                
                UIImage *card1 = [UIImage imageNamed:eTrivArray[trivNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (284);
                center.y = (160);
                [gameCards setCenter:center];
                
                choiceA.hidden = NO;
                choiceB.hidden = NO;
                choiceC.hidden = NO;
                choiceD.hidden = NO;
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                // This if statement responds to a correct guess
                if (choices == eAnsArray[trivNum]) {
                    currentCoord = currentCoord + 2;
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    Dice.hidden = NO;
                }else{
                    wrongX.hidden = NO;
                    
                    moveon = 0;
                    
                    while (moveon == 0)
                    {   // This code causes the program to pause while it waits for a user interaction
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                    }
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    wrongX.hidden = YES;
                    Dice.hidden = NO;
                    
                    if(currentCoord <= 2){
                        currentCoord = currentCoord - 1;
                    }else
                        currentCoord = currentCoord - 2;
                    
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    
                }
                
                
                
                
            }
            // Orange: Dean's Card
            if (currentCoord == 3 || currentCoord == 6 || currentCoord == 13 || currentCoord == 16 || currentCoord == 23 || currentCoord == 26 || currentCoord == 33 || currentCoord == 36 || currentCoord == 43 || currentCoord == 46 || currentCoord == 53 || currentCoord == 56 || currentCoord == 63 || currentCoord == 66 || currentCoord == 73 || currentCoord == 76 || currentCoord == 83 || currentCoord == 86 || currentCoord == 93 || currentCoord == 96 || currentCoord == 103 || currentCoord == 106 || currentCoord == 113 || currentCoord == 116 || currentCoord == 123 || currentCoord == 126 || currentCoord == 133 || currentCoord == 136 || currentCoord == 143 || currentCoord == 146 || currentCoord == 153 || currentCoord == 156 || currentCoord == 163 || currentCoord == 166){
                NSLog(@"Orange: Dean's Card");
                NSArray * dCardArray = [NSArray arrayWithObjects:@"DCard1",@"DCard2", @"DCard3", @"DCard4", @"DCard5", @"DCard6", @"DCard7", @"DCard8", @"DCard9", @"DCard10", nil];
                
                int dSpaceArray[10] = {1, 2, 2, 2, 1, 1, 2, 3, 1, 2};
                // Card number will serve the same purpose as Triv Num
                dcardNum = arc4random() % 10;
                
                gameCards.hidden = NO;
                dismissCard.hidden = NO;
                Dice.hidden = YES;
                
                UIImage *card1 = [UIImage imageNamed:dCardArray[dcardNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                
                
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                
                currentCoord = currentCoord - dSpaceArray[dcardNum];
                
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
            }
            // Yellow: Medium Trivia
            if (currentCoord == 4 || currentCoord == 5 || currentCoord == 14 || currentCoord == 15 || currentCoord == 24 || currentCoord == 25 || currentCoord == 34 || currentCoord == 35 || currentCoord == 44 || currentCoord == 45 || currentCoord == 54 || currentCoord == 55 || currentCoord == 64 || currentCoord == 65 || currentCoord == 74 || currentCoord == 75 || currentCoord == 84 || currentCoord == 85 || currentCoord == 94 || currentCoord == 95 || currentCoord == 104 || currentCoord == 105 || currentCoord == 114 || currentCoord == 115 || currentCoord == 124 || currentCoord == 125 || currentCoord == 134 || currentCoord == 135 || currentCoord == 144 || currentCoord == 145 || currentCoord == 154 || currentCoord == 155 || currentCoord == 164 || currentCoord == 165){
                NSArray * mTrivArray = [NSArray arrayWithObjects:@"MTriv1.png", @"MTriv2.png", @"MTriv3.png", @"MTriv4.png", @"MTriv5.png", @"MTriv6.png", @"MTriv7.png", @"MTriv8.png", @"MTriv9.png", @"MTriv10.png",@"MTriv11.png", @"MTriv12.png", @"MTriv13.png", nil];
                int mAnsArray[13] = {3, 4, 2, 3, 4, 1, 2, 1, 4, 3, 3, 3, 2};
                
                trivNum = arc4random() % 13;
                
                UIImage *card1 = [UIImage imageNamed:mTrivArray[trivNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (284);
                center.y = (160);
                [gameCards setCenter:center];
                
                choiceA.hidden = NO;
                choiceB.hidden = NO;
                choiceC.hidden = NO;
                choiceD.hidden = NO;
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                // This if statement responds to a correct guess
                if (choices == mAnsArray[trivNum]) {
                    currentCoord = currentCoord + 2;
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    Dice.hidden = NO;
                }else{
                    wrongX.hidden = NO;
                    
                    moveon = 0;
                    
                    while (moveon == 0)
                    {   // This code causes the program to pause while it waits for a user interaction
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                    }
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    wrongX.hidden = YES;
                    Dice.hidden = NO;
                    
                    if(currentCoord <= 2){
                        currentCoord = currentCoord - 1;
                    }else
                        currentCoord = currentCoord - 2;
                    
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    
                }
                
                
                
                
            }
            break;
        case 3:
            //Hard Code
            // Blue: Scholar's Card
            if (currentCoord == 1 || currentCoord == 8 || currentCoord == 11 || currentCoord == 18 || currentCoord == 21 || currentCoord == 28 || currentCoord == 31 || currentCoord == 38 || currentCoord == 41 || currentCoord == 48 || currentCoord == 51 || currentCoord == 58 || currentCoord == 61 || currentCoord == 68 || currentCoord == 71 || currentCoord == 78 || currentCoord == 81 || currentCoord == 88 || currentCoord == 91 || currentCoord == 98 || currentCoord == 101 || currentCoord == 108 || currentCoord == 111 || currentCoord == 118 || currentCoord == 121 || currentCoord == 128 || currentCoord == 131 || currentCoord == 138 || currentCoord == 141 || currentCoord == 148 || currentCoord == 151 || currentCoord == 158 || currentCoord == 161){
                NSLog(@"Blue: Scholar's");
                NSArray * sCardArray = [NSArray arrayWithObjects:@"SCard1", @"SCard2", @"SCard3", @"SCard4", @"SCard5", @"SCard6", @"SCard7", @"SCard8", @"SCard9", @"SCard10", nil];
                
                int sSpaceArray[10] = {2, 3, 2, 1, 2, 1, 2, 3, 2, 1};
                // Card number will serve the same purpose as Triv Num
                scardNum = arc4random() % 10;
                
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                UIImage *card1 = [UIImage imageNamed:sCardArray[scardNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                dismissCard.hidden = NO;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                
                
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                
                currentCoord = currentCoord + sSpaceArray[scardNum];
                
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
            }
            // Yellow: Medium Trivia
            if (currentCoord == 2 || currentCoord == 7 || currentCoord == 12 || currentCoord == 17 || currentCoord == 22 || currentCoord == 27 || currentCoord == 32 || currentCoord == 37 || currentCoord == 42 || currentCoord == 47 || currentCoord == 52 || currentCoord == 57 || currentCoord == 62 || currentCoord == 67 || currentCoord == 72 || currentCoord == 77 || currentCoord == 82 || currentCoord == 87 || currentCoord == 92 || currentCoord == 97 || currentCoord == 102 || currentCoord == 107 || currentCoord == 112 || currentCoord == 117 || currentCoord == 122 || currentCoord == 127 || currentCoord == 132 || currentCoord == 137 || currentCoord == 142 || currentCoord == 147 || currentCoord == 152 || currentCoord == 157 || currentCoord == 162 || currentCoord == 167){
                NSArray * mTrivArray = [NSArray arrayWithObjects:@"MTriv1.png", @"MTriv2.png", @"MTriv3.png", @"MTriv4.png", @"MTriv5.png", @"MTriv6.png", @"MTriv7.png", @"MTriv8.png", @"MTriv9.png", @"MTriv10.png",@"MTriv11.png", @"MTriv12.png", @"MTriv13.png", nil];
                int mAnsArray[13] = {3, 4, 2, 3, 4, 1, 2, 1, 4, 3, 3, 3, 2};
                
                trivNum = arc4random() % 13;
                
                
                UIImage *card1 = [UIImage imageNamed:mTrivArray[trivNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (284);
                center.y = (160);
                [gameCards setCenter:center];
                
                choiceA.hidden = NO;
                choiceB.hidden = NO;
                choiceC.hidden = NO;
                choiceD.hidden = NO;
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                // This if statement responds to a correct guess
                if (choices == mAnsArray[trivNum]) {
                    currentCoord = currentCoord + 2;
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    Dice.hidden = NO;
                }else{
                    wrongX.hidden = NO;
                    
                    moveon = 0;
                    
                    while (moveon == 0)
                    {   // This code causes the program to pause while it waits for a user interaction
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                    }
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    wrongX.hidden = YES;
                    Dice.hidden = NO;
                    
                    if(currentCoord <= 2){
                        currentCoord = currentCoord - 1;
                    }else
                        currentCoord = currentCoord - 2;
                    
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                }
                
                
            }
            // Orange: Dean's Card
            if (currentCoord == 3 || currentCoord == 6 || currentCoord == 13 || currentCoord == 16 || currentCoord == 23 || currentCoord == 26 || currentCoord == 33 || currentCoord == 36 || currentCoord == 43 || currentCoord == 46 || currentCoord == 53 || currentCoord == 56 || currentCoord == 63 || currentCoord == 66 || currentCoord == 73 || currentCoord == 76 || currentCoord == 83 || currentCoord == 86 || currentCoord == 93 || currentCoord == 96 || currentCoord == 103 || currentCoord == 106 || currentCoord == 113 || currentCoord == 116 || currentCoord == 123 || currentCoord == 126 || currentCoord == 133 || currentCoord == 136 || currentCoord == 143 || currentCoord == 146 || currentCoord == 153 || currentCoord == 156 || currentCoord == 163 || currentCoord == 166){
                NSLog(@"Orange: Dean's Card");
                NSArray * dCardArray = [NSArray arrayWithObjects:@"DCard1",@"DCard2", @"DCard3", @"DCard4", @"DCard5", @"DCard6", @"DCard7", @"DCard8", @"DCard9", @"DCard10", nil];
                
                int dSpaceArray[10] = {1, 2, 2, 2, 1, 1, 2, 3, 1, 2};
                // Card number will serve the same purpose as Triv Num
                dcardNum = arc4random() % 10;
                
                gameCards.hidden = NO;
                dismissCard.hidden = NO;
                Dice.hidden = YES;
                
                UIImage *card1 = [UIImage imageNamed:dCardArray[dcardNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (300);
                center.y = (135);
                [gameCards setCenter:center];
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                
                
                dismissCard.hidden = YES;
                gameCards.hidden = YES;
                Dice.hidden = NO;
                
                currentCoord = currentCoord - dSpaceArray[dcardNum];
                
                center.x = (xCoords[currentCoord] + 11.25);
                center.y = (yCoords[currentCoord] + 11.25);
                [gamePiece setCenter:center];
                
            }
            // Red: Hard Trivia
            if (currentCoord == 4 || currentCoord == 5 || currentCoord == 14 || currentCoord == 15 || currentCoord == 24 || currentCoord == 25 || currentCoord == 34 || currentCoord == 35 || currentCoord == 44 || currentCoord == 45 || currentCoord == 54 || currentCoord == 55 || currentCoord == 64 || currentCoord == 65 || currentCoord == 74 || currentCoord == 75 || currentCoord == 84 || currentCoord == 85 || currentCoord == 94 || currentCoord == 95 || currentCoord == 104 || currentCoord == 105 || currentCoord == 114 || currentCoord == 115 || currentCoord == 124 || currentCoord == 125 || currentCoord == 134 || currentCoord == 135 || currentCoord == 144 || currentCoord == 145 || currentCoord == 154 || currentCoord == 155 || currentCoord == 164 || currentCoord == 165){
                NSArray * hTrivArray = [NSArray arrayWithObjects:@"HTriv1.png", @"HTriv2.png", @"HTriv3.png", @"HTriv4.png", @"HTriv5.png", @"HTriv6.png", @"HTriv7.png", nil];
                int hAnsArray[7] = {1, 1, 1, 4, 1, 2, 2};
                
                trivNum = arc4random() % 7;
                
                UIImage *card1 = [UIImage imageNamed:hTrivArray[trivNum]];
                [gameCards setImage:card1];
                
                CGRect rect = [gameCards frame];
                rect.size.width = 350;
                rect.size.height = 181;
                [gameCards setFrame:rect];
                
                CGPoint center = [gameCards center];
                center.x = (284);
                center.y = (160);
                [gameCards setCenter:center];
                
                choiceA.hidden = NO;
                choiceB.hidden = NO;
                choiceC.hidden = NO;
                choiceD.hidden = NO;
                gameCards.hidden = NO;
                Dice.hidden = YES;
                
                moveon = 0;
                
                while (moveon == 0)
                {   // This code causes the program to pause while it waits for a user interaction
                    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                }
                
                // This if statement responds to a correct guess
                if (choices == hAnsArray[trivNum]) {
                    currentCoord = currentCoord + 2;
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    Dice.hidden = NO;
                }else{
                    wrongX.hidden = NO;
                    
                    NSLog(@"Moveon = %i",moveon);
                    moveon = 0;
                    
                    while (moveon == 0)
                    {   // This code causes the program to pause while it waits for a user interaction
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
                    }
                    
                    gameCards.hidden = YES;
                    choiceA.hidden = YES;
                    choiceB.hidden = YES;
                    choiceC.hidden = YES;
                    choiceD.hidden = YES;
                    wrongX.hidden = YES;
                    Dice.hidden = NO;
                    
                    if(currentCoord <= 2){
                        currentCoord = currentCoord - 1;
                    }else
                        currentCoord = currentCoord - 2;
                    
                    
                    center.x = (xCoords[currentCoord] + 11.25);
                    center.y = (yCoords[currentCoord] + 11.25);
                    [gamePiece setCenter:center];
                }
                
            }
            break;
        default:
            break;
    }
            
    /*
    if (currentCoord = 2,currentCoord = 3, currentCoord = 4,currentCoord = 5,currentCoord = 6,currentCoord = 7) {
        UIImage *card1 = [UIImage imageNamed:@"Flag.png"];
        [gameCards setImage:card1];
        
        CGRect rect = [gameCards frame];
        rect.size.width = 160;
        rect.size.height = 80;
        [gameCards setFrame:rect];
        
        CGPoint center = [gameCards center];
        center.x = (300);
        center.y = (135);
        [gameCards setCenter:center];
        
        Dice.hidden = YES;
    }
     */
    
    [UIView commitAnimations];
    
    
    
}

// Code that will follow a selection of an answer
-(IBAction)choiceMade:(id)sender{
    
    if ([sender isEqual:choiceA]){
        choices = 1;
        NSLog(@"You selected %i",choices);
    } else if ([sender isEqual:choiceB]){
        choices = 2;
        NSLog(@"You selected %i",choices);
    } else if ([sender isEqual:choiceC]){
        choices = 3;
        NSLog(@"You selected %i",choices);
    } else if([sender isEqual:choiceD]){
        choices = 4;
        NSLog(@"You selected %i",choices);
    }
    moveon = 1;
}

-(IBAction)disCard:(id)sender{
    moveon = 1;
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
