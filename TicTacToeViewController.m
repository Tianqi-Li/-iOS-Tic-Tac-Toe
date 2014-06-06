//
//  TicTacToeViewController.m
//  Tianqi.LiLab3
//
//  Created by Tianqi on 13-2-17.
//  Copyright (c) 2013年 Tianqi. All rights reserved.
//

#import "TicTacToeViewController.h"


@interface TicTacToeViewController () {
    int whoseTurn;
    int playerNum;
    int bt[3][3];
  
}

@end

@implementation TicTacToeViewController

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button7;
@synthesize button8;
@synthesize button9;
@synthesize resetButton;
@synthesize buttonturn1;
@synthesize buttonturn2;
@synthesize buttonturn3;
@synthesize buttonOnePlayer;
@synthesize buttonTwoPlayer;
@synthesize userMessageLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];

    [button1 setTag:0];
    [button2 setTag:0];
    [button3 setTag:0];
    [button4 setTag:0];
    [button5 setTag:0];
    [button6 setTag:0];
    [button7 setTag:0];
    [button8 setTag:0];
    [button9 setTag:0];
    [buttonturn1 setTag:11];
    [buttonturn2 setTag:22];
    [buttonturn3 setTag:33];
    [buttonOnePlayer setTag:111];
    [buttonTwoPlayer setTag:222];
    
    whoseTurn = 0;
    playerNum = 0;
    
    self.userMessageLabel.text = @"Welcome!Choose player number";
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)resetBoard {
    [button1 setTag:0];
    [button2 setTag:0];
    [button3 setTag:0];
    [button4 setTag:0];
    [button5 setTag:0];
    [button6 setTag:0];
    [button7 setTag:0];
    [button8 setTag:0];
    [button9 setTag:0];
    
    [button1 setEnabled:YES];
    [button2 setEnabled:YES];
    [button3 setEnabled:YES];
    [button4 setEnabled:YES];
    [button5 setEnabled:YES];
    [button6 setEnabled:YES];
    [button7 setEnabled:YES];
    [button8 setEnabled:YES];
    [button9 setEnabled:YES];
    [buttonturn1 setEnabled:YES];
    [buttonturn2 setEnabled:YES];
    [buttonturn3 setEnabled:YES];
    [buttonOnePlayer setEnabled:YES];
    [buttonTwoPlayer setEnabled:YES];
    
    [button1 setImage:nil forState:UIControlStateNormal];
    [button2 setImage:nil forState:UIControlStateNormal];
    [button3 setImage:nil forState:UIControlStateNormal];
    [button4 setImage:nil forState:UIControlStateNormal];
    [button5 setImage:nil forState:UIControlStateNormal];
    [button6 setImage:nil forState:UIControlStateNormal];
    [button7 setImage:nil forState:UIControlStateNormal];
    [button8 setImage:nil forState:UIControlStateNormal];
    [button9 setImage:nil forState:UIControlStateNormal];
    
    int i,j;
    for (i = 0; i<3; i++) {
        for (j = 0; j<3; j++) {
            bt[i][j]=0;
        }
    }
    
    self.userMessageLabel.text = @"New Game!Whose turn?";

    whoseTurn = 0;
    playerNum = 0;
}

- (IBAction)chooseTurn:(id)sender {
    UIButton *turnButton = sender;
    if (turnButton.tag == 11) {
        whoseTurn = 1;
    }
    else if (turnButton.tag == 22) {
        whoseTurn = 2;
        if (playerNum == 1) {
            button5.tag = 2;
            [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (turnButton.tag == 33){
        int r = arc4random_uniform(9);
        if (r/2 ==1) {
            whoseTurn = 1;
        }
        else whoseTurn =2;
    }
    
}

- (IBAction)choosePlayerNum:(id)sender {
    UIButton *playerNumButton = sender;
    if (playerNumButton.tag == 222) {
        playerNum = 2;
    }
    else playerNum = 1;
    self.userMessageLabel.text = @"New Game!Who is first?";
}

- (IBAction)newGamePressed:(id)sender {
    [self resetBoard];
}

- (BOOL)checkWin:(int) turn{
    [self getButtonTag];
    BOOL winFlag;
    int i,j;
    // Check all the rows
    for (i=0; i<3; i++) {
        winFlag = YES;
        for (j=0; j<3; j++) {
            if (bt[i][j] != turn) {
                winFlag = NO;
            }
        }
        if (winFlag) {
            return YES;
        }
    }
    // Check all the columns
    for (j=0; j<3; j++) {
        winFlag = YES;
        for (i=0; i<3; i++) {
            if (bt[i][j] != turn) {
                winFlag = NO;
            }
        }
        if (winFlag) {
            return YES;
        }
    }
    // Check the down diagonal
    winFlag = YES;
    for (i=0; i<3; i++) {
        if (bt[i][i] != turn) {
            winFlag = NO;
        }
    }
        if (winFlag) {
        return YES;
        }
    // Check the up diagonal
    winFlag = YES;
    for (i=0; i<3; i++) {
        if (bt[3-i-1][i] != turn) {
            winFlag = NO;
        }
    }
    if (winFlag) {
        return YES;
    }


    return NO;
}

- (BOOL)checkOneStepWin:(int)turn {
    [self getButtonTag];
    //BOOL winFlag;
    //Check for rows
        if ( (bt[0][0]==0) && (bt[0][1]==turn) && (bt[0][2]==turn) ) {
            button1.tag = 2;
            [button1 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
            if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
                return YES;
        }
    if ( (bt[0][0]==turn) && (bt[0][1]==0) && (bt[0][2]==turn) ) {
        button2.tag = 2;
         [button2 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][0]==turn) && (bt[0][1]==turn) && (bt[0][2]==0) ) {
        button3.tag = 2;
         [button3 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
        if ( (bt[1][0]==0) && (bt[1][1]==turn) && (bt[1][2]==turn) ) {
            button4.tag = 2;
             [button4 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
            if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
                return YES;
        }
    if ( (bt[1][0]==turn) && (bt[1][1]==0) && (bt[1][2]==turn) ) {
        button5.tag = 2;
         [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){ self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
           return YES;
    }
    if ( (bt[1][0]==turn) && (bt[1][1]==turn) && (bt[1][2]==0) ) {
        button6.tag = 2;
         [button6 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
        if ( (bt[2][0]==0) && (bt[2][1]==turn) && (bt[2][2]==turn) ) {
            button7.tag = 2;
             [button7 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
            if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
                return YES;
        }
    if ( (bt[2][0]==turn) && (bt[2][1]==0) && (bt[2][2]==turn) ) {
        button8.tag = 2;
         [button8 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[2][0]==turn) && (bt[2][1]==turn) && (bt[2][2]==0) ) {
        button9.tag = 2;
         [button9 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    //Check for columns
    if ( (bt[0][0]==0) && (bt[1][0]==turn) && (bt[2][0]==turn) ) {
        button1.tag = 2;
         [button1 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][0]==turn) && (bt[1][0]==0) && (bt[2][0]==turn) ) {
        button4.tag = 2;
         [button4 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][0]==turn) && (bt[1][0]==turn) && (bt[2][0]==0) ) {
        button7.tag = 2;
         [button7 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][1]==0) && (bt[1][1]==turn) && (bt[2][1]==turn) ) {
        button2.tag = 2;
         [button2 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][1]==turn) && (bt[1][1]==0) && (bt[2][1]==turn) ) {
        button5.tag = 2;
         [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][1]==turn) && (bt[1][1]==turn) && (bt[2][1]==0) ) {
        button8.tag = 2;
         [button8 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][2]==0) && (bt[1][2]==turn) && (bt[2][2]==turn) ) {
        button3.tag = 2;
         [button3 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][2]==turn) && (bt[1][2]==0) && (bt[2][2]==turn) ) {
        button6.tag = 2;
         [button6 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){ self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
           return YES;
    }
    if ( (bt[0][2]==turn) && (bt[1][2]==turn) && (bt[2][2]==0) ) {
        button9.tag = 2;
         [button9 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    //Check for diagnals
    if ( (bt[0][0]==0) && (bt[1][1]==turn) && (bt[2][2]==turn) ) {
        button1.tag = 2;
         [button1 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][0]==turn) && (bt[1][1]==0) && (bt[2][2]==turn) ) {
        button5.tag = 2;
         [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][0]==turn) && (bt[1][1]==turn) && (bt[2][2]==0) ) {
        button9.tag = 2;
         [button9 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][2]==0) && (bt[1][1]==turn) && (bt[2][0]==turn) ) {
        button3.tag = 2;
         [button3 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
    if ( (bt[0][2]==turn) && (bt[1][1]==0) && (bt[2][0]==turn) ) {
        button5.tag = 2;
         [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){ self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
           return YES;
    }
    if ( (bt[0][2]==turn) && (bt[1][1]==turn) && (bt[2][0]==0) ) {
        button7.tag = 2;
         [button7 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        if (turn == 2){self.userMessageLabel.text = @"You Lose! New Game?";[self disableButton];}
            return YES;
    }
   
    return NO;
}

- (void)getButtonTag {
    bt[0][0]=button1.tag;bt[0][1]=button2.tag;bt[0][2]=button3.tag;
    bt[1][0]=button4.tag;bt[1][1]=button5.tag;bt[1][2]=button6.tag;
    bt[2][0]=button7.tag;bt[2][1]=button8.tag;bt[2][2]=button9.tag;
}

- (void)fillOneStep:(int)turn{
    [self getButtonTag];
    if (bt[1][1]==0) {
        if (turn == 1) {
            button5.tag = 1;
            [button5 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button5.tag = 2;
        [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[0][1]==0) {
        if (turn == 1) {
            button2.tag = 1;
            [button2 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {button2.tag = 2;
            [button2 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[1][0]==0) {
        if (turn == 1) {
            button4.tag = 1;
            [button4 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button4.tag = 2;
        [button4 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[2][1]==0) {
        if (turn == 1) {
            button8.tag = 1;
            [button8 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button8.tag = 2;
        [button8 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[1][2]==0) {
        if (turn == 1) {
            button6.tag = 1;
            [button6 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button6.tag = 2;
        [button6 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[0][0]==0) {
        if (turn == 1) {
            button1.tag = 1;
            [button1 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button1.tag = 2;
        [button1 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[2][0]==0) {
        if (turn == 1) {
            button7.tag = 1;
            [button7 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button7.tag = 2;
        [button7 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[2][2]==0) {
        if (turn == 1) {
            button9.tag = 1;
            [button9 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button9.tag = 2;
        [button9 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    else if (bt[0][2]==0) {
        if (turn == 1) {
            button3.tag = 1;
            [button3 setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        }
        else {
            button3.tag = 2;
        [button3 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
    }
    
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *currentButton = sender;
    //Two player mode
    if (playerNum == 2) {
       if (currentButton.tag!=0) {
        return;
       }
       else if (whoseTurn==1) {
        currentButton.tag = 1;
        [currentButton setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
        self.userMessageLabel.text = @"O'turn";
        if ([self checkWin:currentButton.tag]) {
            self.userMessageLabel.text = @"X wins! New Game?";
            [self disableButton];
        }
        else  if ([self isBoardFull]) {
            self.userMessageLabel.text = @"Tie Game. New Game?";
            [self disableButton];
            return;
        }
        else whoseTurn = 2;
      }
      else if (whoseTurn==2) {
        currentButton.tag = 2;
        [currentButton setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        self.userMessageLabel.text = @"X'turn";
        if ([self checkWin:currentButton.tag]) {
            self.userMessageLabel.text = @"O wins! New Game?";
            [self disableButton];
        }
        else  if ([self isBoardFull]) {
            self.userMessageLabel.text = @"Tie Game. New Game?";
            [self disableButton];
            return;
        }
        else whoseTurn = 1;
     }
    }
    //One player mode
    if (playerNum == 1) {
        
        //You first
        
       // if (whoseTurn == 1){
            
        if (currentButton.tag != 0) {
            return;
        }
        currentButton.tag = 1;
        [currentButton setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
       
        if ([self isBoardFull]) {
            self.userMessageLabel.text = @"Tie Game. New Game?";
            [self disableButton];
        }
        else if ([self checkWin:currentButton.tag]) {
           self.userMessageLabel.text = @"You win! New Game?";
           [self disableButton];
        }
        else if ([self checkOneStepWin:2]) {
           [self disableButton];
           return;
        }
        else if ([self checkOneStepWin:1]) {
           //[self disableButton];
           return;
        }
        else if ([self isBoardFull]) {
            self.userMessageLabel.text = @"Tie Game. New Game?";
            [self disableButton];
        }
        else {
           [self fillOneStep:2];
           if ([self isBoardFull]) {
               [self disableButton];
               self.userMessageLabel.text = @"Tie Game. New Game?";
           }
           else {self.userMessageLabel.text = @"Your turn";}
      }
    }
  //}
    
    //Computer first
    
   /* if (whoseTurn == 2) {
        if (button5.tag == 0) {
            button5.tag = 2;
            [button5 setImage:[UIImage imageNamed:@"O.png"] forState:UIControlStateNormal];
        }
        else 
    }*/
}

- (void)disableButton {
    [button1 setEnabled:NO];
    [button2 setEnabled:NO];
    [button3 setEnabled:NO];
    [button4 setEnabled:NO];
    [button5 setEnabled:NO];
    [button6 setEnabled:NO];
    [button7 setEnabled:NO];
    [button8 setEnabled:NO];
    [button9 setEnabled:NO];
    
    [buttonturn1 setEnabled:NO];
    [buttonturn2 setEnabled:NO];
    [buttonturn3 setEnabled:NO];
    [buttonOnePlayer setEnabled:NO];
    [buttonTwoPlayer setEnabled:NO];
    
}

- (BOOL)isBoardFull {
    int i,j;
    for (i=0; i<3; i++) {
        for (j=0; j<3; j++) {
            if (bt[i][j]==0)
                return NO;
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
