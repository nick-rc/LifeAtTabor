//
//  GSView.m
//  Life At Tabor
//
//  Created by Nick Craig on 4/22/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import "GSView.h"
#import "LATVariables.h"

@implementation GSView
// Variables for the drawing of the tiles in the game screen
int tilenumber = 166;
int x;
int i = 0;
int difficultylevel/*Selected Difficulty Level*/;
int currentCoord/*Current Coordinate Value of Game Piece*/;

// array with the tile X coordinates
float xCoords[168] = {76.5, 100.5, 124.5, 148.5, 172.5,
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
    146.5, 169.5, 192.5};
// array with the Y coordinates
float yCoords[168] = {282, 282, 282, 282, 282,
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
    190, 190, 190};

-(void) drawRect:(CGRect)rect {
    
    // Easy Array of tiles
    NSArray * EasyTiles = [NSArray arrayWithObjects:@"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", @"WhiteTile.png",
                           @"WhiteTile.png", @"GreenTile.png", @"OrangeTile.png", @"BlueTile.png", @"BlueTile.png", @"OrangeTile.png", @"GreenTile.png", /*@"WhiteTile.png"*/nil];
    // Medium Tile Array
    NSArray * MediumTiles = [NSArray arrayWithObjects: @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png", @"GreenTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"GreenTile.png", @"OrangeTile.png", @"YellowTile.png", @"YellowTile.png", @"OrangeTile.png",nil];
    // Hard Tile Array
    NSArray * HardTiles = [NSArray arrayWithObjects: @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png", @"YellowTile.png", @"BlueTile.png", @"WhiteTile.png",
                             @"WhiteTile.png", @"BlueTile.png", @"YellowTile.png", @"OrangeTile.png", @"RedTile.png", @"RedTile.png", @"OrangeTile.png",nil];
                            
    /* Array containing the game piece image names
     Seawolf = 1; Schooner = 2; Letters = 3; Flag = 4; Seal = 5;
     */
    NSArray * gamepieceArray = [NSArray arrayWithObjects:@"Seawolf.png", @"Schooner.png", @"Letters.png", @"Flag.png", @"Seal.png", nil];

    // Tile Placement Based on Difficulty Selection
    switch (difficultylevel) {
        case 1/*Easy*/:
            i = 0;
            for (x = 0; x <= tilenumber; x++) {
                
                UIImage *randomtile = [UIImage imageNamed:EasyTiles[i]];
                [randomtile drawInRect:CGRectMake(xCoords[x], yCoords[x],
                                                   22.5,
                                                   22.5)];
                i += 1;
                
            }
            break;
            
        case 2/*Medium*/:
            i = 0;
            for (x = 0; x <= tilenumber; x++) {
                
                UIImage *randomtile = [UIImage imageNamed:MediumTiles[i]];
                [ randomtile drawInRect:CGRectMake(xCoords[x], yCoords[x],
                                                       22.5,
                                                       22.5)];
                i += 1;
            }
            break;
            
        case 3/*Hard*/:
            i = 0;
            for (x = 0; x <= tilenumber; x++) {
                
                UIImage *randomtile = [UIImage imageNamed:HardTiles[i]];
                [ randomtile drawInRect:CGRectMake(xCoords[x], yCoords[x],
                                                   22.5,
                                                   22.5)];
                i += 1;
            }
            break;
            
        default:
            break;
    }
UIImage *gameIcon = [UIImage imageNamed:gamepieceArray[charactervalue]];
[gamePiece setImage:gameIcon];
/*[gameIcon drawInRect:CGRectMake(xCoords[0], yCoords[0],
                                 22.5,
                                 22.5)];
*/
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
