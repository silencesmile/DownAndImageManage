//
//  BlurDownloadPicView.h
//  DownAndImage
//
//  Created by youngstar on 16/11/18.
//  Copyright © 2016年 521Travel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlurDownloadPicView : UIView

//图片下载地址
@property (nonatomic, strong)NSString * picUrl;
//图片显示的方式
@property (nonatomic)UIViewContentMode contentMode;
//开始执行
- (void)startProgress;
@end
