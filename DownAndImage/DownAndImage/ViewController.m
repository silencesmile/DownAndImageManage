//
//  ViewController.m
//  DownAndImage
//
//  Created by youngstar on 16/11/18.
//  Copyright © 2016年 521Travel. All rights reserved.
//

#import "ViewController.h"
#import "BlurDownloadPicView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * picUrl = @"http://pic113.nipic.com/file/20161023/23136018_230148792037_2.jpg";
    BlurDownloadPicView * blurPicView = [[BlurDownloadPicView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:blurPicView];
    blurPicView.picUrl = picUrl;
    [blurPicView startProgress];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
