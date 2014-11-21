//
//  BtnView.h
//  scrollViewBtn
//
//  Created by guakeliao on 14/11/20.
//  Copyright (c) 2014年 Boco. All rights reserved.
//
@class BtnView;
typedef void(^btnViewClick)(BtnView *myView);
#import <UIKit/UIKit.h>

@interface BtnView : UIView
@property (strong, nonatomic)  UIImageView *UnSelectImage;
@property (strong, nonatomic)  UIImageView *SelectImage;
@property (nonatomic,assign) BOOL selected;
@property (nonatomic,copy)btnViewClick btnViewClicked;

- (instancetype)initWithFrame:(CGRect)frame withDict:(NSMutableDictionary *)dict;

@end

