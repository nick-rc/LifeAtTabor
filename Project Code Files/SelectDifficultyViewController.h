//
//  SelectDifficultyViewController.h
//  Life At Tabor
//
//  Created by Nick Craig on 4/9/13.
//  Copyright (c) 2013 Nick Craig. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SelectDifficultyViewController : UIViewController{
    // Three Buttons included on Select Difficulty
    UIButton * HardButton;
    UIButton * MedButton;
    UIButton * EasyButton;
}
@property (nonatomic, retain) IBOutlet UIButton *HardButton;
@property (nonatomic, retain) IBOutlet UIButton *MedButton;
@property (nonatomic, retain) IBOutlet UIButton *EasyButton;
// This creates an action for the back button to go back one page
- (IBAction)dismissSelDif:(id)sender;
- (IBAction)difficultySelected:(id)sender;

@end
