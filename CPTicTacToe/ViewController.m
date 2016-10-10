//
//  ViewController.m
//  CPTicTacToe
//
//  Created by Student P_07 on 28/09/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializationOfGame];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializationOfGame{
    numberOfPlayingTurns = 0;
    currentPlayer = 1;
    gameFinished = false;
    
    winCombinationArray = @[@[@0,@1,@2],
                            @[@1,@4,@7],
                            @[@3,@4,@5],
                            @[@2,@5,@8],
                            @[@6,@7,@8],
                            @[@0,@4,@8],
                            @[@0,@3,@6],
                            @[@2,@4,@6]];
    
    stateArray = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    
    for (int i = 100; i <= 108; i++) {
        UIButton *button = [self.view viewWithTag:i];
        [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
        
    }
    
    
}



- (IBAction)TapActionButton:(id)sender {
    
    numberOfPlayingTurns= numberOfPlayingTurns+1;
    UIButton *tile=sender;
    int player=currentPlayer;
    UIImage *playerImage;
    
    BOOL isButtonNotSelected = [[stateArray objectAtIndex:(tile.tag-100)] isEqual:@0];
    
    if (isButtonNotSelected) {
        if (!gameFinished) {
            if (player == 1) {
                
                
                playerImage = [UIImage imageNamed:@"nought"];
                [stateArray replaceObjectAtIndex:(tile.tag - 100) withObject:@1];
                
                currentPlayer = 2;
                
            }
            else
            {
                playerImage = [UIImage imageNamed:@"cross"];
                [stateArray replaceObjectAtIndex:(tile.tag-100) withObject:@2];
                
                currentPlayer = 1;
                
                
            }
        }
        
        [tile setBackgroundImage:playerImage forState:UIControlStateNormal];
    }
    else{
        [self showAlertWithTitle:@"caution" message:@"Please select another tile..."];
        
    }
    
    
    if (numberOfPlayingTurns >= 5) {
        for( NSArray *combination in winCombinationArray){
            
            int indexOfTileOne = [[combination objectAtIndex:0] intValue];
            int indexOfTileTwo = [[combination objectAtIndex:1] intValue];
            int indexOfTileThree = [[combination objectAtIndex:2] intValue];
            
            NSNumber *stateAtTileOne = [stateArray objectAtIndex:indexOfTileOne];
            NSNumber *stateAtTileTwo = [stateArray objectAtIndex:indexOfTileTwo];
            NSNumber *stateAtTileThree = [stateArray objectAtIndex:indexOfTileThree];
            
            if (![stateAtTileOne isEqual:@0] && [stateAtTileOne isEqual:stateAtTileTwo] && [stateAtTileTwo isEqual:stateAtTileThree]) {
                gameFinished = YES;
                NSString *winnerStatement = [NSString stringWithFormat:@"player %d has won",player];
                
                [self showAlertForEndWithTitle:winnerStatement message:@"Do you want to play again"];
                break;
            }
            
        }
    }
    if ( !gameFinished) {
        BOOL valuePresent = [stateArray containsObject:@0];
        
        if (!valuePresent) {
            [self showAlertForEndWithTitle:@"Game Draw" message:@"Do you want to play again"];
            
        }
    }
    

}

-(void)showAlertWithTitle: (NSString *)title
                  message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok button pressed");
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)showAlertForEndWithTitle: (NSString *)title
                        message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self initializationOfGame];
        
        
    }];
    
    [alert addAction:OK];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
        
    }];
    [alert addAction:cancle];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
