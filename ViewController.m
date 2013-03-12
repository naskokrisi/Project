//
//  ViewController.m
//  GPS Project
//
//  Created by Nasko on 3/12/13.
//  Copyright (c) 2013 Nasko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

-(IBAction)StartTrack {
    if (mapView.showsUserLocation == NO) {
        
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Please turn on your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        
        
    }
    else if (Track == 1) {
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Your track is ON" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        //[StartTrack setTitle:@"Start"];
        
        /* CLLocationCoordinate2D lastLocation = CLLocationCoordinate2DMake(42.0321319, 43.0113131);
         CLLocationCoordinate2D currentLocation = [[MKUserLocation alloc] location].coordinate;
         [self routeTrack:lastLocation atCurrent2DLocation:currentLocation];
         */
        
        Track = 2 ;
        
    }
    else if (Track == 2) {
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Your track is OFF" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        Track = 1 ;
    }
}

-(IBAction)myLocation:(id)sender {
    mapView.showsUserLocation = YES;
    [mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
    if (Location == 1) {
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Location is ON" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        Location = 2;
    }
}

-(IBAction)getLocation {
    if(Location == 2) {
        mapView.showsUserLocation = NO;
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Location is OFF" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        Location = 1;
    }
    else if(Location == 1) {
        mapView.showsUserLocation = YES;
        UIAlertView *alert = [[ UIAlertView alloc] initWithTitle:nil message:@"Location is ON" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert autorelease];
        Location = 2;
    }
}

-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex)
    {
        case 0:
        {
            mapView.mapType = MKMapTypeStandard;
            break;
        }
        case 1:
        {
            mapView.mapType = MKMapTypeSatellite;
            break;
        }
        case 2:
        {
            mapView.mapType = MKMapTypeHybrid;
            break;
        }
    }
}
@synthesize mapView;


-(void)routeTrack:(CLLocationCoordinate2D) lastLocation atCurrent2DLocation:(CLLocationCoordinate2D) currentLocation {
    
    CLLocationCoordinate2D *plotLocation = malloc(sizeof(CLLocationCoordinate2D) * 2);
    plotLocation[0]=lastLocation;
    plotLocation[1]=currentLocation;;
    MKPolyline *line = [MKPolyline polylineWithCoordinates:plotLocation count:2];
    [mapView addOverlay:line];
    [mapView setCenterCoordinate:plotLocation[0]];
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    Location = 1;
    Track = 1;
    mapView.showsUserLocation = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end