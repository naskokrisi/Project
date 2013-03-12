//
//  ViewController.h
//  GPS Project
//
//  Created by Nasko on 3/12/13.
//  Copyright (c) 2013 Nasko. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKReverseGeocoder.h>

@interface ViewController : UIViewController {
    int Location;
    int Track;
    MKMapView *mapView;
    
}
-(void)routeTrack:(CLLocationCoordinate2D)lastLocation atCurrent2DLocation:(CLLocationCoordinate2D)currentLocation;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)StartTrack;
-(IBAction)myLocation:(id)sender;
-(IBAction)getLocation;
-(IBAction)setMap:(id)sender;

@end