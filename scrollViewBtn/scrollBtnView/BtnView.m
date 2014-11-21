//
//  BtnView.m
//  scrollViewBtn
//
//  Created by guakeliao on 14/11/20.
//  Copyright (c) 2014年 Boco. All rights reserved.
//
#import "BtnView.h"
#import "Macros.h"
#pragma mark
#pragma mark SelectView UnSelectView
@interface SelectView:UIView

- (instancetype)initWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr withLabelText:(NSString *)text;
@end

@implementation SelectView
- (instancetype)initWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr withLabelText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        [self comInitWithImageStr:imageStr withLabelText:text];
    }
    return self;
}
-(void)comInitWithImageStr:(NSString *)imageStr withLabelText:(NSString *)text
{
    NSArray *arrStr = [text componentsSeparatedByString:@"\n"];
    UIImageView* selectImage = [[UIImageView alloc]initWithFrame:self.bounds];
    selectImage.image = [UIImage imageNamed:imageStr];
    [self addSubview:selectImage];
    /*******************************/
    UILabel *selectLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(7, 10, CGRectGetWidth(self.bounds)-14, CGRectGetHeight(self.bounds)/2-10)];
    selectLabel1.backgroundColor = [UIColor clearColor];
    selectLabel1.textAlignment = NSTextAlignmentCenter;
    selectLabel1.font = [UIFont boldSystemFontOfSize:12];
    selectLabel1.textColor = [UIColor whiteColor];
    selectLabel1.adjustsFontSizeToFitWidth = YES;
    selectLabel1.text = [arrStr firstObject];
    [self addSubview:selectLabel1];
    
    UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(7, self.bounds.size.height/2, CGRectGetWidth(self.bounds) - 14, 1)];
    lineLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineLabel];
    
    UILabel *selectLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(6, self.bounds.size.height/2-2, CGRectGetWidth(self.bounds)-14, CGRectGetHeight(self.bounds)/2-10)];
    selectLabel2.backgroundColor = [UIColor clearColor];
    selectLabel2.textAlignment = NSTextAlignmentCenter;
    selectLabel2.font = [UIFont boldSystemFontOfSize:12];
    selectLabel2.adjustsFontSizeToFitWidth = YES;
    selectLabel2.textColor = [UIColor whiteColor];
    selectLabel2.text = [arrStr lastObject];
    [self addSubview:selectLabel2];
}

@end


@interface UnSelectView:UIView

- (instancetype)initWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr withLabelText:(NSString *)text;
@end

@implementation UnSelectView

- (instancetype)initWithFrame:(CGRect)frame withImageStr:(NSString *)imageStr withLabelText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        [self comInitWithImageStr:imageStr withLabelText:text];
    }
    return self;
}
-(void)comInitWithImageStr:(NSString *)imageStr withLabelText:(NSString *)text
{
    UIImageView *unSelectImage = [[UIImageView alloc]initWithFrame:self.bounds];
    unSelectImage.image = [UIImage imageNamed:imageStr];
    [self addSubview:unSelectImage];
    
    UILabel *unSelectLabel = [[UILabel alloc]initWithFrame:self.bounds];
    unSelectLabel.backgroundColor = [UIColor clearColor];
    unSelectLabel.textAlignment = NSTextAlignmentCenter;
    unSelectLabel.font = [UIFont boldSystemFontOfSize:14];
    unSelectLabel.textColor = [UIColor whiteColor];
    unSelectLabel.lineBreakMode = NSLineBreakByWordWrapping;
    unSelectLabel.numberOfLines = 0;
    unSelectLabel.text = text;
    [self addSubview:unSelectLabel];
}

@end

@interface BtnView()<UIGestureRecognizerDelegate>

@property (strong, nonatomic)  SelectView *selectView;
@property (strong, nonatomic)  UnSelectView *unSelectView;

@end

@implementation BtnView
-(void)setSelected:(BOOL)selected
{
    if (selected)
    {
        _selectView.hidden = NO;
        _unSelectView.hidden = YES;
    }else
    {
        _selectView.hidden = YES;
        _unSelectView.hidden = NO;
    }
}

- (instancetype)initWithFrame:(CGRect)frame withDict:(NSMutableDictionary *)dict
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commInitWithDict:dict];
    }
    return self;
}
-(void)commInitWithDict:(NSMutableDictionary *)dict
{
    _selected = NO;
    //自身的imageView
    UIImageView *selfImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2.0 - 6/2, CGRectGetWidth(self.bounds), 6)];
    selfImageView.image = [UIImage imageNamed:@"backGround"];
    [self addSubview:selfImageView];
    
    NSString *unSelectImageStr = [dict objectForKey:NOMALKEY];
    NSString *selectImageStr = [dict objectForKey:HEIGHTKEY];
    NSString *unSelect_TitleStr = [dict objectForKey:NOMALKEY_TITLEKEY];
    NSString *select_TitleStr = [dict objectForKey:HEIGHTKEY_TITLEKEY];
    _selectView = [[SelectView alloc]initWithFrame:self.bounds
                                      withImageStr:selectImageStr
                                     withLabelText:select_TitleStr];
    _selectView.hidden = YES;
    
    _unSelectView = [[UnSelectView alloc]initWithFrame:CGRectMake(16, self.bounds.size.height/2 -(CGRectGetWidth(self.bounds)-32)/2, CGRectGetWidth(self.bounds)-32, CGRectGetHeight(self.bounds)-32)
                                          withImageStr:unSelectImageStr
                                         withLabelText:unSelect_TitleStr];
    [self addSubview:_selectView];
    [self addSubview:_unSelectView];
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self addGestureRecognizer:singleTap];
    singleTap.delegate = self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer

{
    return YES;
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender

{
//    CGPoint point = [sender locationInView:self];
    _selected = !_selected;
    if (_btnViewClicked) {
        _btnViewClicked(self);
    }
} 

@end
