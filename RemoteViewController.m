//
//  RemoteViewController.m
//  Tah Remote
//
//  Created by Dhiraj on 23/01/15.
//  Copyright (c) 2015 dhirajjadhao. All rights reserved.
//

#import "RemoteViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface RemoteViewController ()
{
    NSString *command, *seperator, *end;
    
    NSArray *ReceivedData;
    
    NSString *protocol, *irvalue, *bits;
    
    NSString *zerokeyprotocol,*zerokeyIRvalue, *zerokeybits;
    NSString *onekeyprotocol,*onekeyIRvalue, *onekeybits;
    NSString *twokeyprotocol,*twokeyIRvalue, *twokeybits;
    NSString *threekeyprotocol,*threekeyIRvalue, *threekeybits;
    NSString *fourkeyprotocol,*fourkeyIRvalue, *fourkeybits;
    NSString *fivekeyprotocol,*fivekeyIRvalue, *fivekeybits;
    NSString *sixkeyprotocol,*sixkeyIRvalue, *sixkeybits;
    NSString *sevenkeyprotocol,*sevenkeyIRvalue, *sevenkeybits;
    NSString *eightkeyprotocol,*eightkeyIRvalue, *eightkeybits;
    NSString *ninekeyprotocol,*ninekeyIRvalue, *ninekeybits;

    NSString *tvavkeyprotocol,*tvavkeyIRvalue, *tvavkeybits;
    NSString *menukeyprotocol,*menukeyIRvalue, *menukeybits;
    
    NSString *upkeyprotocol,*upkeyIRvalue, *upkeybits;
    NSString *downkeyprotocol,*downkeyIRvalue, *downkeybits;
    NSString *rightkeyprotocol,*rightkeyIRvalue, *rightkeybits;
    NSString *leftkeyprotocol,*leftkeyIRvalue, *leftkeybits;
    NSString *okkeyprotocol,*okkeyIRvalue, *okkeybits;
    
    NSString *volupkeyprotocol,*volupkeyIRvalue, *volupkeybits;
    NSString *voldownkeyprotocol,*voldownkeyIRvalue, *voldownkeybits;
    NSString *chupkeyprotocol,*chupkeyIRvalue, *chupkeybits;
    NSString *chdownkeyprotocol,*chdownkeyIRvalue, *chdownkeybits;
    NSString *powerkeyprotocol,*powerkeyIRvalue, *powerkeybits;
    NSString *mutekeyprotocol,*mutekeyIRvalue, *mutekeybits;

    
    UIAlertView *alert;
    
    

}
@end

@implementation RemoteViewController

@synthesize peripheral;
@synthesize sensor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Settings Up Sensor Delegate
    self.sensor.delegate = self;
    
    
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    
    // Value Intialization
    
    seperator = @",";
    end = @"R";

    
    
    
    ////// Retrieving Button Values
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    
    // Zero Key
    zerokeyprotocol = [defaults objectForKey:@"zerokeyprotocol"];
    zerokeyIRvalue = [defaults objectForKey:@"zerokeyIRvalue"];
    zerokeybits = [defaults objectForKey:@"zerokeybits"];
    
    
    // One key
    onekeyprotocol = [defaults objectForKey:@"onekeyprotocol"];
    onekeyIRvalue = [defaults objectForKey:@"onekeyIRvalue"];
    onekeybits = [defaults objectForKey:@"onekeybits"];
    
    // two key
    twokeyprotocol = [defaults objectForKey:@"twokeyprotocol"];
    twokeyIRvalue = [defaults objectForKey:@"twokeyIRvalue"];
    twokeybits = [defaults objectForKey:@"twokeybits"];
    
    // three key
    threekeyprotocol = [defaults objectForKey:@"threekeyprotocol"];
    threekeyIRvalue = [defaults objectForKey:@"threekeyIRvalue"];
    threekeybits = [defaults objectForKey:@"threekeybits"];
    
    // four key
    fourkeyprotocol = [defaults objectForKey:@"fourkeyprotocol"];
    fourkeyIRvalue = [defaults objectForKey:@"fourkeyIRvalue"];
    fourkeybits = [defaults objectForKey:@"fourkeybits"];
    
    // five key
    fivekeyprotocol = [defaults objectForKey:@"fivekeyprotocol"];
    fivekeyIRvalue = [defaults objectForKey:@"fivekeyIRvalue"];
    fivekeybits = [defaults objectForKey:@"fivekeybits"];
    
    // six key
    sixkeyprotocol = [defaults objectForKey:@"sixkeyprotocol"];
    sixkeyIRvalue = [defaults objectForKey:@"sixkeyIRvalue"];
    sixkeybits = [defaults objectForKey:@"sixkeybits"];
    
    // seven key
    sevenkeyprotocol = [defaults objectForKey:@"sevenkeyprotocol"];
    sevenkeyIRvalue = [defaults objectForKey:@"sevenkeyIRvalue"];
    sevenkeybits = [defaults objectForKey:@"sevenkeybits"];
    
    // eight key
    eightkeyprotocol = [defaults objectForKey:@"eightkeyprotocol"];
    eightkeyIRvalue = [defaults objectForKey:@"eightkeyIRvalue"];
    eightkeybits = [defaults objectForKey:@"eightkeybits"];
    
    // nine key
    ninekeyprotocol = [defaults objectForKey:@"ninekeyprotocol"];
    ninekeyIRvalue = [defaults objectForKey:@"ninekeyIRvalue"];
    ninekeybits = [defaults objectForKey:@"ninekeybits"];
    
    
    
    // tvav key
    tvavkeyprotocol = [defaults objectForKey:@"tvavkeyprotocol"];
    tvavkeyIRvalue = [defaults objectForKey:@"tvavkeyIRvalue"];
    tvavkeybits = [defaults objectForKey:@"tvavkeybits"];
    
    // menu key
    menukeyprotocol = [defaults objectForKey:@"menukeyprotocol"];
    menukeyIRvalue = [defaults objectForKey:@"menukeyIRvalue"];
    menukeybits = [defaults objectForKey:@"menukeybits"];
    
    
    
    // up key
    upkeyprotocol = [defaults objectForKey:@"upkeyprotocol"];
    upkeyIRvalue = [defaults objectForKey:@"upkeyIRvalue"];
    upkeybits = [defaults objectForKey:@"upkeybits"];
    // down key
    downkeyprotocol = [defaults objectForKey:@"downkeyprotocol"];
    downkeyIRvalue = [defaults objectForKey:@"downkeyIRvalue"];
    downkeybits = [defaults objectForKey:@"downkeybits"];
    
    // right key
    rightkeyprotocol = [defaults objectForKey:@"rightkeyprotocol"];
    rightkeyIRvalue = [defaults objectForKey:@"rightkeyIRvalue"];
    rightkeybits = [defaults objectForKey:@"rightkeybits"];
    
    // left key
    leftkeyprotocol = [defaults objectForKey:@"leftkeyprotocol"];
    leftkeyIRvalue = [defaults objectForKey:@"leftkeyIRvalue"];
    leftkeybits = [defaults objectForKey:@"leftkeybits"];
    
    // ok key
    okkeyprotocol = [defaults objectForKey:@"okkeyprotocol"];
    okkeyIRvalue = [defaults objectForKey:@"okkeyIRvalue"];
    okkeybits = [defaults objectForKey:@"okkeybits"];
    
    
    
    // volup key
    volupkeyprotocol = [defaults objectForKey:@"volupkeyprotocol"];
    volupkeyIRvalue = [defaults objectForKey:@"volupkeyIRvalue"];
    volupkeybits = [defaults objectForKey:@"volupkeybits"];
    
    // voldown key
    voldownkeyprotocol = [defaults objectForKey:@"voldownkeyprotocol"];
    voldownkeyIRvalue = [defaults objectForKey:@"voldownkeyIRvalue"];
    voldownkeybits = [defaults objectForKey:@"voldownkeybits"];
    
    // chup key
    chupkeyprotocol = [defaults objectForKey:@"chupkeyprotocol"];
    chupkeyIRvalue = [defaults objectForKey:@"chupkeyIRvalue"];
    chupkeybits = [defaults objectForKey:@"chupkeybits"];
    
    // chdown key
    chdownkeyprotocol = [defaults objectForKey:@"chdownkeyprotocol"];
    chdownkeyIRvalue = [defaults objectForKey:@"chdownkeyIRvalue"];
    chdownkeybits = [defaults objectForKey:@"chdownkeybits"];
    
    // power key
    powerkeyprotocol = [defaults objectForKey:@"powerkeyprotocol"];
    powerkeyIRvalue = [defaults objectForKey:@"powerkeyIRvalue"];
    powerkeybits = [defaults objectForKey:@"powerkeybits"];
    
    // mute key
    mutekeyprotocol = [defaults objectForKey:@"mutekeyprotocol"];
    mutekeyIRvalue = [defaults objectForKey:@"mutekeyIRvalue"];
    mutekeybits = [defaults objectForKey:@"mutekeybits"];
    
    
    //////
    

    
}


-(void)viewWillAppear:(BOOL)animated
{
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}


///////////// Update Device Connection Status Image //////////
-(void)UpdateConnectionStatusLabel
{
    
    
    if (sensor.activePeripheral.state)
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
    else
    {
        
        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:128.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//recv data
-(void) TAHbleCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSString *value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    
    
    
    // Start storing Received value if in programming mode
    if(RemoteProgramModeSwitch.on)
    {
        //NSLog(@"%@",value);
        
        ReceivedData = [value componentsSeparatedByString: @","];
       if(ReceivedData.count == 3)
       {
        protocol = [ReceivedData objectAtIndex:0];
        irvalue = [ReceivedData objectAtIndex:1];
        
        int protocolint = [protocol intValue];
        

        [self ValueReceivedTone]; // Play Received value tone
       
        
        if(protocolint == 0 || protocolint >=8)
        {
            
            
            if (alert.visible == NO) {
                
            
            //////// Local Alert Settings
            
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            
            alert = [[UIAlertView alloc] initWithTitle:@"Not Supported"
                                                            message:@"If this error is appearing repeatedly then this remote controller is not yet supported by Tah Remote App Or Try pressing remote button again"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            
            /////////////////////////////////////////////
            }
        }
         
       }


        
    }
        
    
}





-(void)setConnect
{
    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )sensor.activePeripheral.identifier);
    NSLog(@"%@",(__bridge NSString*)s);
    
}

-(void)setDisconnect
{
    [sensor disconnect:sensor.activePeripheral];
    
    NSLog(@"TAH Device Disconnected");
    
    
    //////// Local Alert Settings
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    /////////////////////////////////////////////
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}




- (IBAction)RemoteProgramModeSwitch:(id)sender {
    
    if (RemoteProgramModeSwitch.on)
    {
        remoteprogmodelabel.hidden = NO;
        RemoteBGimage.alpha = 0.9;
        
        
        
    }
    
    
    else
    {
        remoteprogmodelabel.hidden = YES;
        RemoteBGimage.alpha = 1.0;
  
       

    }
    
    
}




- (IBAction)zero:(id)sender
{
    NSLog(@"Zero Button Pressed");
    
    if (RemoteProgramModeSwitch.on)
    {
        if(ReceivedData.count == 3)
        {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        zerokeyprotocol = [ReceivedData objectAtIndex:0];
        zerokeyIRvalue = [ReceivedData objectAtIndex:1];
        zerokeybits = [ReceivedData objectAtIndex:2];
        
        [defaults setObject:zerokeyprotocol forKey:@"zerokeyprotocol"];
        [defaults setObject:zerokeyIRvalue forKey:@"zerokeyIRvalue"];
        [defaults setObject:zerokeybits forKey:@"zerokeybits"];
            
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
            
    }
    
    else
    {
       
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",zerokeyprotocol,seperator,zerokeyIRvalue,seperator,zerokeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }

}
- (IBAction)one:(id)sender
{
    
    NSLog(@"One Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            onekeyprotocol = [ReceivedData objectAtIndex:0];
            onekeyIRvalue = [ReceivedData objectAtIndex:1];
            onekeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:onekeyprotocol forKey:@"onekeyprotocol"];
            [defaults setObject:onekeyIRvalue forKey:@"onekeyIRvalue"];
            [defaults setObject:onekeybits forKey:@"onekeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
           [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
 
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",onekeyprotocol,seperator,onekeyIRvalue,seperator,onekeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }

}



- (IBAction)two:(id)sender
{
    
    NSLog(@"Two Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            twokeyprotocol = [ReceivedData objectAtIndex:0];
            twokeyIRvalue = [ReceivedData objectAtIndex:1];
            twokeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:twokeyprotocol forKey:@"twokeyprotocol"];
            [defaults setObject:twokeyIRvalue forKey:@"twokeyIRvalue"];
            [defaults setObject:twokeybits forKey:@"twokeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",twokeyprotocol,seperator,twokeyIRvalue,seperator,twokeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }

    

}




- (IBAction)three:(id)sender
{

    
    NSLog(@"Three Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            threekeyprotocol = [ReceivedData objectAtIndex:0];
            threekeyIRvalue = [ReceivedData objectAtIndex:1];
            threekeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:threekeyprotocol forKey:@"threekeyprotocol"];
            [defaults setObject:threekeyIRvalue forKey:@"threekeyIRvalue"];
            [defaults setObject:threekeybits forKey:@"threekeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",threekeyprotocol,seperator,threekeyIRvalue,seperator,threekeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
}



- (IBAction)four:(id)sender
{

    
    NSLog(@"Four Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            fourkeyprotocol = [ReceivedData objectAtIndex:0];
            fourkeyIRvalue = [ReceivedData objectAtIndex:1];
            fourkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:fourkeyprotocol forKey:@"fourkeyprotocol"];
            [defaults setObject:fourkeyIRvalue forKey:@"fourkeyIRvalue"];
            [defaults setObject:fourkeybits forKey:@"fourkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",fourkeyprotocol,seperator,fourkeyIRvalue,seperator,fourkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
}



- (IBAction)five:(id)sender
{
    
    
    NSLog(@"Five Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            fivekeyprotocol = [ReceivedData objectAtIndex:0];
            fivekeyIRvalue = [ReceivedData objectAtIndex:1];
            fivekeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:fivekeyprotocol forKey:@"fivekeyprotocol"];
            [defaults setObject:fivekeyIRvalue forKey:@"fivekeyIRvalue"];
            [defaults setObject:fivekeybits forKey:@"fivekeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",fivekeyprotocol,seperator,fivekeyIRvalue,seperator,fivekeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    

}



- (IBAction)six:(id)sender
{

    
    NSLog(@"Six Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            sixkeyprotocol = [ReceivedData objectAtIndex:0];
            sixkeyIRvalue = [ReceivedData objectAtIndex:1];
            sixkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:sixkeyprotocol forKey:@"sixkeyprotocol"];
            [defaults setObject:sixkeyIRvalue forKey:@"sixkeyIRvalue"];
            [defaults setObject:sixkeybits forKey:@"sixkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",sixkeyprotocol,seperator,sixkeyIRvalue,seperator,sixkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
    
}



- (IBAction)seven:(id)sender
{
  
    NSLog(@"Seven Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            sevenkeyprotocol = [ReceivedData objectAtIndex:0];
            sevenkeyIRvalue = [ReceivedData objectAtIndex:1];
            sevenkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:sevenkeyprotocol forKey:@"sevenkeyprotocol"];
            [defaults setObject:sevenkeyIRvalue forKey:@"sevenkeyIRvalue"];
            [defaults setObject:sevenkeybits forKey:@"sevenkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",sevenkeyprotocol,seperator,sevenkeyIRvalue,seperator,sevenkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
}



- (IBAction)eight:(id)sender
{

    NSLog(@"Eight Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            eightkeyprotocol = [ReceivedData objectAtIndex:0];
            eightkeyIRvalue = [ReceivedData objectAtIndex:1];
            eightkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:eightkeyprotocol forKey:@"eightkeyprotocol"];
            [defaults setObject:eightkeyIRvalue forKey:@"eightkeyIRvalue"];
            [defaults setObject:eightkeybits forKey:@"eightkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",eightkeyprotocol,seperator,eightkeyIRvalue,seperator,eightkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
}



- (IBAction)nine:(id)sender
{

    
    NSLog(@"Nine Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            ninekeyprotocol = [ReceivedData objectAtIndex:0];
            ninekeyIRvalue = [ReceivedData objectAtIndex:1];
            ninekeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:ninekeyprotocol forKey:@"ninekeyprotocol"];
            [defaults setObject:ninekeyIRvalue forKey:@"ninekeyIRvalue"];
            [defaults setObject:ninekeybits forKey:@"ninekeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",ninekeyprotocol,seperator,ninekeyIRvalue,seperator,ninekeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
    
    
    
    
}





- (IBAction)tvav:(id)sender
{
    NSLog(@"TVAV Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            tvavkeyprotocol = [ReceivedData objectAtIndex:0];
            tvavkeyIRvalue = [ReceivedData objectAtIndex:1];
            tvavkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:tvavkeyprotocol forKey:@"tvavkeyprotocol"];
            [defaults setObject:tvavkeyIRvalue forKey:@"tvavkeyIRvalue"];
            [defaults setObject:tvavkeybits forKey:@"tvavkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",tvavkeyprotocol,seperator,tvavkeyIRvalue,seperator,tvavkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)menu:(id)sender
{
    NSLog(@"Menu Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            menukeyprotocol = [ReceivedData objectAtIndex:0];
            menukeyIRvalue = [ReceivedData objectAtIndex:1];
            menukeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:menukeyprotocol forKey:@"menukeyprotocol"];
            [defaults setObject:menukeyIRvalue forKey:@"menukeyIRvalue"];
            [defaults setObject:menukeybits forKey:@"menukeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",menukeyprotocol,seperator,menukeyIRvalue,seperator,menukeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}





- (IBAction)up:(id)sender
{
    NSLog(@"Up Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            menukeyprotocol = [ReceivedData objectAtIndex:0];
            menukeyIRvalue = [ReceivedData objectAtIndex:1];
            menukeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:menukeyprotocol forKey:@"menukeyprotocol"];
            [defaults setObject:menukeyIRvalue forKey:@"menukeyIRvalue"];
            [defaults setObject:menukeybits forKey:@"menukeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",menukeyprotocol,seperator,menukeyIRvalue,seperator,menukeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)down:(id)sender
{
    NSLog(@"Down Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            menukeyprotocol = [ReceivedData objectAtIndex:0];
            menukeyIRvalue = [ReceivedData objectAtIndex:1];
            menukeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:menukeyprotocol forKey:@"menukeyprotocol"];
            [defaults setObject:menukeyIRvalue forKey:@"menukeyIRvalue"];
            [defaults setObject:menukeybits forKey:@"menukeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",menukeyprotocol,seperator,menukeyIRvalue,seperator,menukeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}





- (IBAction)right:(id)sender
{
    NSLog(@"Right Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            rightkeyprotocol = [ReceivedData objectAtIndex:0];
            rightkeyIRvalue = [ReceivedData objectAtIndex:1];
            rightkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:rightkeyprotocol forKey:@"rightkeyprotocol"];
            [defaults setObject:rightkeyIRvalue forKey:@"rightkeyIRvalue"];
            [defaults setObject:rightkeybits forKey:@"rightkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",rightkeyprotocol,seperator,rightkeyIRvalue,seperator,rightkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}





- (IBAction)left:(id)sender
{
    NSLog(@"Left Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            leftkeyprotocol = [ReceivedData objectAtIndex:0];
            leftkeyIRvalue = [ReceivedData objectAtIndex:1];
            leftkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:leftkeyprotocol forKey:@"leftkeyprotocol"];
            [defaults setObject:leftkeyIRvalue forKey:@"leftkeyIRvalue"];
            [defaults setObject:leftkeybits forKey:@"leftkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",leftkeyprotocol,seperator,leftkeyIRvalue,seperator,leftkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)ok:(id)sender
{
    NSLog(@"OK Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            okkeyprotocol = [ReceivedData objectAtIndex:0];
            okkeyIRvalue = [ReceivedData objectAtIndex:1];
            okkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:okkeyprotocol forKey:@"okkeyprotocol"];
            [defaults setObject:okkeyIRvalue forKey:@"okkeyIRvalue"];
            [defaults setObject:okkeybits forKey:@"okkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",okkeyprotocol,seperator,okkeyIRvalue,seperator,okkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}





- (IBAction)volup:(id)sender
{
    NSLog(@"Volume Up Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            volupkeyprotocol = [ReceivedData objectAtIndex:0];
            volupkeyIRvalue = [ReceivedData objectAtIndex:1];
            volupkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:volupkeyprotocol forKey:@"volupkeyprotocol"];
            [defaults setObject:volupkeyIRvalue forKey:@"volupkeyIRvalue"];
            [defaults setObject:volupkeybits forKey:@"volupkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",volupkeyprotocol,seperator,volupkeyIRvalue,seperator,volupkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)voldown:(id)sender
{
    NSLog(@"Volume Down Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            voldownkeyprotocol = [ReceivedData objectAtIndex:0];
            voldownkeyIRvalue = [ReceivedData objectAtIndex:1];
            voldownkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:voldownkeyprotocol forKey:@"voldownkeyprotocol"];
            [defaults setObject:voldownkeyIRvalue forKey:@"voldownkeyIRvalue"];
            [defaults setObject:voldownkeybits forKey:@"voldownkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",voldownkeyprotocol,seperator,voldownkeyIRvalue,seperator,voldownkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)chup:(id)sender
{
    NSLog(@"Channel Up Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            chupkeyprotocol = [ReceivedData objectAtIndex:0];
            chupkeyIRvalue = [ReceivedData objectAtIndex:1];
            chupkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:chupkeyprotocol forKey:@"chupkeyprotocol"];
            [defaults setObject:chupkeyIRvalue forKey:@"chupkeyIRvalue"];
            [defaults setObject:chupkeybits forKey:@"chupkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",chupkeyprotocol,seperator,chupkeyIRvalue,seperator,chupkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)chdown:(id)sender
{
    NSLog(@"Channel Down Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            chdownkeyprotocol = [ReceivedData objectAtIndex:0];
            chdownkeyIRvalue = [ReceivedData objectAtIndex:1];
            chdownkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:chdownkeyprotocol forKey:@"chdownkeyprotocol"];
            [defaults setObject:chdownkeyIRvalue forKey:@"chdownkeyIRvalue"];
            [defaults setObject:chdownkeybits forKey:@"chdownkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",chdownkeyprotocol,seperator,chdownkeyIRvalue,seperator,chdownkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)power:(id)sender
{
    NSLog(@"Power Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            powerkeyprotocol = [ReceivedData objectAtIndex:0];
            powerkeyIRvalue = [ReceivedData objectAtIndex:1];
            powerkeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:powerkeyprotocol forKey:@"powerkeyprotocol"];
            [defaults setObject:powerkeyIRvalue forKey:@"powerkeyIRvalue"];
            [defaults setObject:powerkeybits forKey:@"powerkeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",powerkeyprotocol,seperator,powerkeyIRvalue,seperator,powerkeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




- (IBAction)mute:(id)sender
{
    NSLog(@"Mute Button Pressed");
    
    
    if (RemoteProgramModeSwitch.on)
    {
        if (ReceivedData.count == 3)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            mutekeyprotocol = [ReceivedData objectAtIndex:0];
            mutekeyIRvalue = [ReceivedData objectAtIndex:1];
            mutekeybits = [ReceivedData objectAtIndex:2];
            
            [defaults setObject:mutekeyprotocol forKey:@"mutekeyprotocol"];
            [defaults setObject:mutekeyIRvalue forKey:@"mutekeyIRvalue"];
            [defaults setObject:mutekeybits forKey:@"mutekeybits"];
            
            [self ValueSetTone];
        }
        
        else
        {
            [self garbageValueAlert];
        }
        
    }
    
    else
    {
        
        
        command = [NSString stringWithFormat:@"%@%@%@%@%@%@",mutekeyprotocol,seperator,mutekeyIRvalue,seperator,mutekeybits,end];
        NSLog(@"%@",command);
        NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
        [sensor write:sensor.activePeripheral data:feed];
    }
}




-(void)garbageValueAlert
{
    //////// Local Alert Settings
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    alert = [[UIAlertView alloc] initWithTitle:@"Garbage Value Received"
                                       message:@"Try pressing remote controller key again"
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
    [alert show];
    
    /////////////////////////////////////////////
}


-(void)ValueReceivedTone
{
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"sound1", CFSTR("wav"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}


-(void)ValueSetTone
{
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"sound2", CFSTR("wav"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}


@end
