//
//  ViewController.m
//  image_demo
//
//  Created by zhangxinwei on 15/10/19.
//  Copyright (c) 2015年 zhangxinwei. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton *addIMgButton;
@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.view addSubview:self.addIMgButton];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 0.1, 0.1);
    imageView.backgroundColor = [UIColor greenColor];
    imageView.tag = 101;
    
    [self.view addSubview:imageView];
//    CGFloat W = [[UIScreen mainScreen]bounds].size.width;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark action

- (void)goPhoto {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.allowsEditing = YES; 
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:controller animated:YES completion:^{}];
}

- (void)savePhoto {
    
}

#pragma mark property

- (UIButton *)addIMgButton {
    if (_addIMgButton == nil) {
        _addIMgButton = [[UIButton alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT - 40, 50, 30)];
        [_addIMgButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addIMgButton setTitle:@"add" forState:UIControlStateNormal];
        _addIMgButton.backgroundColor = [UIColor grayColor];
        [_addIMgButton addTarget:self action:@selector(goPhoto) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addIMgButton;
}

#pragma mark delegate

// 选中照片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", info);
    UIImageView  *imageView = (UIImageView *)[self.view viewWithTag:101];
    // UIImagePickerControllerOriginalImage 原始图片
    // UIImagePickerControllerEditedImage 编辑后图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

// 取消相册
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
