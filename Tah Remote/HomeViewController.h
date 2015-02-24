//
//  HomeViewController.h
//  Tah Remote
//
//  Created by Dhiraj on 23/01/15.
//  Copyright (c) 2015 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "AppDelegate.h"

@class CBPeripheral;
@class TAHble;

@interface HomeViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,BTSmartSensorDelegate>
{
    NSArray *arrayOfdescription;
    NSArray *arrayofImages;
    NSArray *arrayofCellIdentifiers;

    IBOutlet UILabel *ConnectionStatusLabel;
    
}

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;


@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;


@end
