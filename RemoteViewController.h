//
//  RemoteViewController.h
//  Tah Remote
//
//  Created by Dhiraj on 23/01/15.
//  Copyright (c) 2015 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "AppDelegate.h"

@interface RemoteViewController : UIViewController<BTSmartSensorDelegate>
{

   
    IBOutlet UILabel *ConnectionStatusLabel;
    IBOutlet UILabel *remoteprogmodelabel;
    IBOutlet UISwitch *RemoteProgramModeSwitch;
    IBOutlet UIImageView *RemoteBGimage;
    
    
    // Remote Control Keys
    IBOutlet UIButton *zero;
    IBOutlet UIButton *one;
    IBOutlet UIButton *two;
    IBOutlet UIButton *three;
    IBOutlet UIButton *four;
    IBOutlet UIButton *five;
    IBOutlet UIButton *six;
    IBOutlet UIButton *seven;
    IBOutlet UIButton *eight;
    IBOutlet UIButton *nine;
    
    IBOutlet UIButton *tvav;
    IBOutlet UIButton *menu;
 
    IBOutlet UIButton *up;
    IBOutlet UIButton *down;
    IBOutlet UIButton *right;
    IBOutlet UIButton *left;
    IBOutlet UIButton *ok;
    
    IBOutlet UIButton *volup;
    IBOutlet UIButton *voldown;
    IBOutlet UIButton *chup;
    IBOutlet UIButton *chdown;
    IBOutlet UIButton *power;
    IBOutlet UIButton *mute;
    
    
    
}

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;


- (IBAction)RemoteProgramModeSwitch:(id)sender;


    // Remote Control Keys


- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;

- (IBAction)tvav:(id)sender;
- (IBAction)menu:(id)sender;

- (IBAction)up:(id)sender;
- (IBAction)down:(id)sender;
- (IBAction)right:(id)sender;
- (IBAction)left:(id)sender;
- (IBAction)ok:(id)sender;

- (IBAction)volup:(id)sender;
- (IBAction)voldown:(id)sender;
- (IBAction)chup:(id)sender;
- (IBAction)chdown:(id)sender;
- (IBAction)power:(id)sender;
- (IBAction)mute:(id)sender;


@end
