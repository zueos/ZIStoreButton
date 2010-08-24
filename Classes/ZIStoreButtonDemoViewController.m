/*
//  ZIStoreButtonDemoViewController.m
//  ZIStoreButtonDemo
//
//  Created by Brandon Emrich on 7/20/10.
*/

/*
//	Copyright 2010 Brandon Emrich
//
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//
//	http://www.apache.org/licenses/LICENSE-2.0
//
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
*/

#import "ZIStoreButtonDemoViewController.h"
#import "ZIStoreButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZIStoreButtonDemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
		
	ZIStoreButton *button = [[ZIStoreButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 22.0)];
	[button setTitle:@"$1.99" forState:UIControlStateNormal];
	button.center = self.view.center;
	
	CAGradientLayer *bgLayer = [self backgroundLayer];
	bgLayer.frame = self.view.bounds;
	
	[self.view.layer addSublayer:bgLayer];
	
	[self.view addSubview:button];
	
	UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 10.0, 320.0, 35.0)];
	titleLab.backgroundColor = [UIColor clearColor];
	titleLab.text = @"ZIStoreButton";
	titleLab.font = [UIFont systemFontOfSize:24.0];
	titleLab.textAlignment = UITextAlignmentCenter;
	titleLab.shadowColor = [UIColor colorWithWhite:0.98 alpha:1.0];
	titleLab.shadowOffset = CGSizeMake(0.0, 0.75);
	titleLab.textColor = [UIColor colorWithWhite:0.50 alpha:1.0];
	
	[self.view addSubview:titleLab];
	
	UILabel *detailLab = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 55.0, 300.0, 120.0)];
	detailLab.backgroundColor = [UIColor clearColor];
	detailLab.numberOfLines = 7;
	detailLab.text = @"  This is a UIButton subclass that use's Core Animation Layers to present itself.  A CAAnimation is rendered using the keypath for the 'colors' property of the CAGradeintLayer.\n\n  Not a single image resource is ever used to render any part of the button.";
	detailLab.font = [UIFont systemFontOfSize:13.0];
	detailLab.shadowColor = [UIColor colorWithWhite:0.98 alpha:1.0];
	detailLab.shadowOffset = CGSizeMake(0.0, 1.0);
	detailLab.textColor = [UIColor colorWithWhite:0.50 alpha:1.0];
	
	[self.view addSubview:detailLab];
}


- (CAGradientLayer*) backgroundLayer {
	
	UIColor *colorOne		= [UIColor colorWithWhite:0.9 alpha:1.0];
	UIColor *colorTwo		= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.85 alpha:1.0];
	UIColor *colorThree	    = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.7 alpha:1.0];
	UIColor *colorFour		= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.4 alpha:1.0];
		
	NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, nil];
	
	NSNumber *stopOne		= [NSNumber numberWithFloat:0.0];
	NSNumber *stopTwo		= [NSNumber numberWithFloat:0.02];
	NSNumber *stopThree	    = [NSNumber numberWithFloat:0.99];
	NSNumber *stopFour		= [NSNumber numberWithFloat:1.0];
	
	NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, nil];
	
	CAGradientLayer *headerLayer = [CAGradientLayer layer];
	//headerLayer.frame = CGRectMake(0.0, 0.0, 320.0, 77.0);
	headerLayer.colors = colors;
	headerLayer.locations = locations;
	
	return headerLayer;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
