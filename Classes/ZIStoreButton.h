//
//  ZIStoreButton.h
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define ZI_BUY_NOW_TITLE @"Buy Now"
#define ZI_MAX_WIDTH 120.0f

#define ZI_PADDING 10.0f

#if NS_BLOCKS_AVAILABLE
typedef void (^ActionBlock)();
#endif

@interface ZIStoreButton : UIButton 
{
	CAGradientLayer *innerLayer3;
	BOOL isBlued;
#if NS_BLOCKS_AVAILABLE
	ActionBlock _actionBlock;
#endif
	id userInfo;
}

@property (nonatomic, retain) id userInfo;

#if NS_BLOCKS_AVAILABLE
-(void)setBuyBlock:(ActionBlock)action;
#endif


@end
