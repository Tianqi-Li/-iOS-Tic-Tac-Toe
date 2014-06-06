//
//  TicTacToeViewController.h
//  Tianqi.LiLab3
//
//  Created by Tianqi on 13-2-17.
//  Copyright (c) 2013年 Tianqi. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class TicTacToeGame;
@interface TicTacToeViewController : UIViewController {
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
    UIButton *button9;
    UIButton *resetButton;
    UIButton *buttonturn1;
    UIButton *buttonturn2;
    UIButton *buttonturn3;
    UIButton *buttonOnePlayer;
    UIButton *buttonTwoPlayer;
    
    UILabel *userMessageLabel;
    
    //TicTacToeGame *game;
    
}

@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;
@property (nonatomic, retain) IBOutlet UIButton *button4;
@property (nonatomic, retain) IBOutlet UIButton *button5;
@property (nonatomic, retain) IBOutlet UIButton *button6;
@property (nonatomic, retain) IBOutlet UIButton *button7;
@property (nonatomic, retain) IBOutlet UIButton *button8;
@property (nonatomic, retain) IBOutlet UIButton *button9;
@property (nonatomic, retain) IBOutlet UIButton *buttonturn1;
@property (nonatomic, retain) IBOutlet UIButton *buttonturn2;
@property (nonatomic, retain) IBOutlet UIButton *buttonturn3;
@property (nonatomic, retain) IBOutlet UIButton *resetButton;
@property (nonatomic, retain) IBOutlet UIButton *buttonOnePlayer;
@property (nonatomic, retain) IBOutlet UIButton *buttonTwoPlayer;
@property (nonatomic, retain) IBOutlet UILabel *userMessageLabel;

//@property (nonatomic, retain) TicTacToeGame *game;

//- (IBAction)changeButtonColor :(id)sender;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)newGamePressed:(id)sender;
- (IBAction)chooseTurn:(id)sender;
- (IBAction)choosePlayerNum:(id)sender;
- (BOOL)checkWin:(int)turn;
- (BOOL)checkOneStepWin:(int)turn;
- (BOOL)isBoardFull;
- (void)fillOneStep:(int)turn;
- (void)disableButton;
- (void)resetBoard;
@end
