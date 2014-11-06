//
//  ViewController.m
//  CubeSim
//
//  Created by Daher Alfawares on 7/17/14.
//  Copyright (c) 2014 Daher Alfawares. All rights reserved.
//

#import "ViewController.h"
#import "Beacon.h"

@interface ViewController ()
@property Beacon* beacon;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

-(std::string)UDIDStringWithSide:(int)side
{
    switch (side) {
        case 1: return "cd2ae830-0e19-11e4-9191-0800200c9a66";
        case 2: return "cd2ae831-0e19-11e4-9191-0800200c9a66";
        case 3: return "cd2ae832-0e19-11e4-9191-0800200c9a66";
        case 4: return "cd2ae833-0e19-11e4-9191-0800200c9a66";
        case 5: return "cd2ae834-0e19-11e4-9191-0800200c9a66";
        case 6: return "cd2ae835-0e19-11e4-9191-0800200c9a66";
    }
    return "";
}


-(UIColor*)ColorWithSide:(int)side
{
    switch (side) {
        case 1: return [UIColor greenColor];//cd2ae830-0e19-11e4-9191-0800200c9a66
        case 2: return [UIColor blueColor];//cd2ae831-0e19-11e4-9191-0800200c9a66
        case 3: return [UIColor redColor];//cd2ae832-0e19-11e4-9191-0800200c9a66
        case 4: return [UIColor yellowColor];//cd2ae833-0e19-11e4-9191-0800200c9a66
        case 5: return [UIColor orangeColor];//cd2ae834-0e19-11e4-9191-0800200c9a66
        case 6: return [UIColor purpleColor];//cd2ae835-0e19-11e4-9191-0800200c9a66
    }
    return [UIColor whiteColor];
}

-(void)orientationChanged:(id)orientation
{
    int side = [[UIDevice currentDevice] orientation];
    self.beacon = [[Beacon alloc] initWithUUID:[self UDIDStringWithSide:side]
                                     withMajor:0
                                     withMinor:0];
    [self.beacon startAdvertizing];
    
    [self.view setBackgroundColor:[self ColorWithSide:side]];
}

@end
