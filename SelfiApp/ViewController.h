//
//  ViewController.h
//  SelfiApp
//
//  Created by vikas on 24/03/17.
//  Copyright © 2017 vikas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *imagePicker;
}
@property (weak, nonatomic) IBOutlet UIImageView *mergeImg;

- (IBAction)TakePicture:(id)sender;
@end

