//
//  ScrollViewMenu.h
//  scrollViewBtn
//
//  Created by guakeliao on 14/11/20.
//  Copyright (c) 2014年 Boco. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Macros.h"

typedef void(^btnClick)(NSInteger i);
@interface ScrollViewMenu : UIView
/**
 *  item里面的信息
 */
@property(nonatomic,strong) NSMutableArray *itemInfoArray;
/**
 *  item的宽度以及高度
 */
@property (nonatomic,assign) CGFloat itemWeithAndHeight;
@property (nonatomic,copy) btnClick btnClick;
-(void)reloadArray:(NSMutableArray *)array;

#pragma mark 选中某个button
-(void)clickButtonAtIndex:(NSInteger)aIndex;

-(void)changeButtonStateAtIndex:(NSInteger)aIndex;
@end
