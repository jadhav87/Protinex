//
//  ViewController.m
//  SelfiApp
//
//  Created by vikas on 24/03/17.
//  Copyright © 2017 vikas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"running");
    
//    self.mergeImg.image = [self mergeImages:@"baby1.jpg" forImgMode:0];
//    [self CapturePicture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)CapturePicture{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.mergeImg.image = [self mergeImages:chosenImage forImgMode:1];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (UIImage *) mergeImages:(UIImage *)image forImgMode:(NSUInteger)mode {
    
    UIImage *bottomImage = nil;
    
    bottomImage = [UIImage imageNamed:@"landscap_logo.png"];
    
//    if (mode == 0) {
//        bottomImage = [UIImage imageNamed:@"bg.png"];
//    }else{
//        bottomImage = [UIImage imageNamed:@"landscap_logo.png"];
//    }
    
//    UIImage *image       = [UIImage imageNamed:fgImageFileName]; //foreground image
    
    CGSize newSize = CGSizeMake(bottomImage.size.width, bottomImage.size.height);
    UIGraphicsBeginImageContext(newSize);
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    [image drawInRect:CGRectMake(5,5,newSize.width - 270,newSize.height - 10) blendMode:kCGBlendModeNormal alpha:1.0];
    
//    if (mode == 0) {
//        [image drawInRect:CGRectMake(5,5,newSize.width - 10,newSize.height - 298) blendMode:kCGBlendModeNormal alpha:1.0];
//    }else{
//        [image drawInRect:CGRectMake(5,5,newSize.width - 10,newSize.height - 140) blendMode:kCGBlendModeNormal alpha:1.0];
//    }
    
    
    NSLog(@"width : %f",(newSize.width - 10));
    NSLog(@"height : %f",(newSize.height - 298));
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    //----------------------- Saving img ------------------------------//
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    return newImage;
}

- (void)savedPhotoImage:(UIImage *)image
  didFinishSavingWithError:(NSError *)error
               contextInfo:(void *)contextInfo
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"image saved");
}

- (IBAction)TakePicture:(id)sender {
    
    [self CapturePicture];
}
@end
