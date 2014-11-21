//
//  ScrollViewMenu.m
//  scrollViewBtn
//
//  Created by guakeliao on 14/11/20.
//  Copyright (c) 2014年 Boco. All rights reserved.
//
#define BUTTONITEMWIDTH   70

#import "ScrollViewMenu.h"
#import "BtnView.h"
@interface ScrollViewMenu()

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) NSMutableArray *buttonArray;
@property(nonatomic,strong) NSMutableArray *infoArray;
@property(nonatomic,assign) float totalWidth;

@end
@implementation ScrollViewMenu

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commInit];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commInit];
    }
    return self;
}
-(void)reloadArray:(NSMutableArray *)array
{
    [self createMenuItems:array];
}
-(void)commInit
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    if (!_infoArray) {
        _infoArray = [NSMutableArray array];
    }
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
}
-(void)layoutSubviews
{
    [super  layoutSubviews];
    _scrollView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    
}
-(void)createMenuItems:(NSArray *)aItemsArray{
    int i = 0;
    float menuWidth = 0.0;
    for (NSMutableDictionary *lDic in aItemsArray) {
        float vButtonWidth = [[lDic objectForKey:TITLEWIDTH] floatValue];
        BtnView *vButton = [[BtnView alloc]initWithFrame:CGRectMake(menuWidth, _scrollView.frame.size.height/2.0 - vButtonWidth/2.0, vButtonWidth, vButtonWidth)
                                                withDict:lDic];
        [vButton setTag:i];
        [_scrollView addSubview:vButton];
        [_buttonArray addObject:vButton];
        vButton.btnViewClicked = ^(BtnView *btnView){
            [self menuButtonClicked:btnView];
        };
        menuWidth += vButtonWidth;
        i++;
        
        //保存button资源信息，同时增加button.oringin.x的位置，方便点击button时，移动位置。
        NSMutableDictionary *vNewDic = [lDic mutableCopy];
        [vNewDic setObject:[NSNumber numberWithFloat:menuWidth] forKey:TOTALWIDTH];
        [_infoArray addObject:vNewDic];
    }
    
    [_scrollView setContentSize:CGSizeMake(menuWidth, CGRectGetHeight(self.bounds))];
    // 保存menu总长度，如果小于320则不需要移动，方便点击button时移动位置的判断
    _totalWidth = menuWidth;
}
#pragma mark - 其他辅助功能
#pragma mark 取消所有button点击状态
-(void)changeButtonsToNormalState{
    for (BtnView *vButton in _buttonArray) {
        vButton.selected = NO;
    }
}

#pragma mark 模拟选中第几个button
-(void)clickButtonAtIndex:(NSInteger)aIndex{
    BtnView *vButton = [_buttonArray objectAtIndex:aIndex];
    [self menuButtonClicked:vButton];
}

-(void)changeButtonStateAtIndex:(NSInteger)aIndex{
    BtnView *vButton = [_buttonArray objectAtIndex:aIndex];
    [self changeButtonsToNormalState];
    vButton.selected = YES;
//    [self moveScrolViewWithIndex:aIndex];
}

//TODO:暂时没有实现
#pragma mark 移动button到可视的区域 有问题
-(void)moveScrolViewWithIndex:(NSInteger)aIndex{

    NSLog(@"%f",_scrollView.contentOffset.y);
    NSDictionary *vDic = [_infoArray objectAtIndex:aIndex];
    float vButtonOrigin = [[vDic objectForKey:TOTALWIDTH] floatValue];
    if (vButtonOrigin >= CGRectGetWidth(self.bounds)) {
        if ((vButtonOrigin +  CGRectGetWidth(self.bounds)/2.0) >= _scrollView.contentSize.width)
        {
            [_scrollView setContentOffset:CGPointMake(_scrollView.contentSize.width - 180, _scrollView.contentOffset.y) animated:YES];
            return;
        }
        
        float vMoveToContentOffset = vButtonOrigin - 180;
        if (vMoveToContentOffset > 0) {
            [_scrollView setContentOffset:CGPointMake(vMoveToContentOffset, _scrollView.contentOffset.y) animated:YES];
        }
    }else{
        [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentOffset.y) animated:YES];
        return;
    }
}

-(void)menuButtonClicked:(BtnView* )aButton{
    [self changeButtonStateAtIndex:aButton.tag];
    if (_btnClick) {
        _btnClick(aButton.tag);
    }
}

@end
