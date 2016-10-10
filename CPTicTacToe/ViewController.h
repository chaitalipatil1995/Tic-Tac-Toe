//
//  ViewController.h
//  CPTicTacToe
//
//  Created by Student P_07 on 28/09/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
        //for check purpose
        
        int numberOfPlayingTurns;
        int currentPlayer;
        BOOL gameFinished;
        UIButton *tapButton;
        
        
        
        NSArray *winCombinationArray;
        NSMutableArray *stateArray;
    

}
- (IBAction)TapActionButton:(id)sender;


@end

