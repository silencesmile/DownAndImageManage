//
//  BlurDownloadPicView.m
//  DownAndImage
//
//  Created by youngstar on 16/11/18.
//  Copyright © 2016年 521Travel. All rights reserved.
//

#import "BlurDownloadPicView.h"
#import "GCD.h"
#import "UIImage+ImageEffects.h"

@interface BlurDownloadPicView ()
@property (nonatomic, strong)UIImageView * imageView;
@end
@implementation BlurDownloadPicView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
    }
    return self;
}
- (void)loadSubViews{
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    self.imageView.alpha = 0;
    [self addSubview:self.imageView];
}
- (void)startProgress{
    if (self.picUrl) {
        [GCDQueue executeInGlobalQueue:^{
            //创建请求
            NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.picUrl]];  //因为是同步请求,会阻塞主线程(mainQueue)
            NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            //获取图片
            UIImage * image = [[UIImage alloc]initWithData:data];
            //对图片进行模糊,会阻塞主线程(mainQueue)
            UIImage * blurImage = [image blurImage];
            [GCDQueue executeInMainQueue:^{
                //加载图片
                self.imageView.image = blurImage;
                [UIView animateWithDuration:1 animations:^{
                    self.imageView.alpha = 1;
                }];
            }];
        }]; 
    }
}
//重写set,get方法
-(void)setContentMode:(UIViewContentMode)contentMode{ 
    self.contentMode = contentMode; 
    self.imageView.contentMode = contentMode;
}
- (UIViewContentMode)contentMode{ 
    return self.contentMode;}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
