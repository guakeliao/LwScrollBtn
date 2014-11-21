//
//  ViewController.m
//  scrollViewBtn
//
//  Created by guakeliao on 14/11/20.
//  Copyright (c) 2014年 Boco. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewMenu.h"
#import "Macros.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ScrollViewMenu *demo;

@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *vButtonItemArray = @[@{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    NOMALKEY_TITLEKEY:@"一月",
                                    HEIGHTKEY_TITLEKEY:@"新闻头条",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal.png",
                                    HEIGHTKEY:@"helight.png",
                                    NOMALKEY_TITLEKEY:@"推荐",
                                    HEIGHTKEY_TITLEKEY:@"推荐头条",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"娱乐",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"娱乐",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"娱乐",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐\n轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:40*2]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"xinwen",
                                    HEIGHTKEY_TITLEKEY:@"轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐\n轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐\n轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐\n轻松一刻推荐娱乐\n轻松一刻推荐娱乐\n轻松一刻推荐娱乐\n轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  @{NOMALKEY: @"normal",
                                    HEIGHTKEY:@"helight",
                                    NOMALKEY_TITLEKEY:@"轻松一刻",
                                    HEIGHTKEY_TITLEKEY:@"推荐娱乐\n轻松一刻",
                                    TITLEWIDTH:[NSNumber numberWithFloat:80]
                                    },
                                  ];
    _demo.itemInfoArray = [NSMutableArray  arrayWithArray:vButtonItemArray];
    _demo.btnClick = ^(NSInteger i)
    {
        NSLog(@"%d",i);
    };
    [_demo reloadArray:_demo.itemInfoArray ];
    [_demo  clickButtonAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
