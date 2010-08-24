//
//  ZIStoreButton.m
//  ZIStoreButtonDemo
//
//  Created by Brandon Emrich on 7/20/10.
//  Copyright 2010 Zueos, Inc. All rights reserved.
//

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

#import "ZIStoreButton.h"

@implementation ZIStoreButton


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		
		self.autoresizesSubviews = YES;
		self.layer.needsDisplayOnBoundsChange = YES;
		
		isBlued = NO;
		
		[self setTitle:@"Purchase Now" forState:UIControlStateSelected];
		[self setTitleShadowColor:[UIColor colorWithWhite:0.200 alpha:1.000] forState:UIControlStateNormal];
		[self setTitleShadowColor:[UIColor colorWithWhite:0.200 alpha:1.000] forState:UIControlStateSelected];
		[self.titleLabel setShadowOffset:CGSizeMake(0.0, -0.6)];
		[self.titleLabel setFont:[UIFont boldSystemFontOfSize:12.0]];
		self.titleLabel.textColor = [UIColor colorWithWhite:0.902 alpha:1.000];
		self.titleEdgeInsets = UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0);
		
		[self addTarget:self action:@selector(touchedUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
		[self addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
		
		CAGradientLayer *bevelLayer2 = [CAGradientLayer layer];
		bevelLayer2.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.4 alpha:1.0] CGColor], [[UIColor whiteColor] CGColor], nil];
		bevelLayer2.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame));
		bevelLayer2.cornerRadius = 5.0;
		bevelLayer2.needsDisplayOnBoundsChange = YES;
		
		CAGradientLayer *innerLayer2 = [CAGradientLayer layer];
		innerLayer2.colors = [NSArray arrayWithObjects:(id)[[UIColor darkGrayColor] CGColor], [[UIColor lightGrayColor] CGColor], nil];
		innerLayer2.frame = CGRectMake(0.5, 0.5, CGRectGetWidth(frame) - 1.0, CGRectGetHeight(frame) - 1.0);
		innerLayer2.cornerRadius = 4.6;
		innerLayer2.needsDisplayOnBoundsChange = YES;
		
		UIColor *blueOne		= [UIColor colorWithRed:0.306 green:0.380 blue:0.547 alpha:1.000];
		UIColor *blueTwo		= [UIColor colorWithRed:0.258 green:0.307 blue:0.402 alpha:1.000];
		UIColor *blueThree	    = [UIColor colorWithRed:0.159 green:0.270 blue:0.550 alpha:1.000];
		UIColor *blueFour		= [UIColor colorWithRed:0.129 green:0.220 blue:0.452 alpha:1.000];
		
		NSArray *blueColors  = [NSArray arrayWithObjects:(id)blueOne.CGColor, blueTwo.CGColor, blueThree.CGColor, blueFour.CGColor, nil];		
		
		innerLayer3 = [CAGradientLayer layer];
		innerLayer3.colors = blueColors;
		innerLayer3.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.500], [NSNumber numberWithFloat:0.5001], [NSNumber numberWithFloat:1.0], nil];		
		innerLayer3.frame = CGRectMake(0.75, 0.75, CGRectGetWidth(frame) - 1.5, CGRectGetHeight(frame) - 1.5);
		innerLayer3.cornerRadius = 4.5;
		innerLayer3.needsDisplayOnBoundsChange = YES;
		
		[self.layer addSublayer:bevelLayer2];
		[self.layer addSublayer:innerLayer2];
		[self.layer addSublayer:innerLayer3];
		
		[self bringSubviewToFront:self.titleLabel];
		
    }
    return self;
}


- (void) setSelected:(BOOL)selected {
	
	[super setSelected:selected];
	
	[CATransaction begin];
	[CATransaction setAnimationDuration:0.25];
	
	UIColor *blueOne		= [UIColor colorWithRed:0.306 green:0.380 blue:0.547 alpha:1.000];
	UIColor *blueTwo		= [UIColor colorWithRed:0.258 green:0.307 blue:0.402 alpha:1.000];
	UIColor *blueThree	    = [UIColor colorWithRed:0.159 green:0.270 blue:0.550 alpha:1.000];
	UIColor *blueFour		= [UIColor colorWithRed:0.129 green:0.220 blue:0.452 alpha:1.000];
	
	UIColor *greenOne		= [UIColor colorWithRed:0.482 green:0.674 blue:0.406 alpha:1.000];
	UIColor *greenTwo		= [UIColor colorWithRed:0.525 green:0.742 blue:0.454 alpha:1.000];
	UIColor *greenThree	    = [UIColor colorWithRed:0.346 green:0.719 blue:0.183 alpha:1.000];
	UIColor *greenFour		= [UIColor colorWithRed:0.299 green:0.606 blue:0.163 alpha:1.000];
	
	NSArray *blueColors  = [NSArray arrayWithObjects:(id)blueOne.CGColor, blueTwo.CGColor, blueThree.CGColor, blueFour.CGColor, nil];
	NSArray *greenColors = [NSArray arrayWithObjects:(id)greenOne.CGColor, greenTwo.CGColor, greenThree.CGColor, greenFour.CGColor, nil];
		
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
		
	animation.fromValue = (!self.selected) ? greenColors : blueColors;
	animation.toValue = (!self.selected) ? blueColors : greenColors;
	
	animation.duration = 0.25;
	animation.removedOnCompletion = NO;
	animation.fillMode = kCAFillModeForwards;
	animation.delegate = self;
	
	[innerLayer3 layoutIfNeeded];
	[innerLayer3 addAnimation:animation forKey:@"changeToBlue"];
	
	for (CALayer *la in self.layer.sublayers) {
		CGRect cr = la.bounds;
		cr.size.width = (!self.selected) ? cr.size.width - 50.0 : cr.size.width + 50.0;
		la.bounds = cr;
		[la layoutIfNeeded];
	}
	
	CGRect cr = self.frame;
	cr.size.width = (!self.selected) ? cr.size.width - 50.0 : cr.size.width + 50.0;
	self.frame = cr;
	
	self.titleEdgeInsets = (!self.selected) ? UIEdgeInsetsMake(2.0, 0.0, 0.0, 0.0) : UIEdgeInsetsMake(2.0, -50.0, 0.0, 0.0);
	
	[CATransaction commit];
}

- (IBAction) touchedUpOutside:(id)sender {
	if (self.selected) {
		[self setSelected:NO];
	}
}


- (IBAction) pressButton:(id)sender {
	if (isBlued) {
		[sender setSelected:NO];
		isBlued = NO;
	} else {
		[sender setSelected:YES];
		isBlued = YES;
	}
}


- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	
	NSLog(@"Animation Did Stop");

}


- (void)dealloc {
    [super dealloc];
}


@end
