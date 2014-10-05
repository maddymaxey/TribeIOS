//
//  TestViewController.h
//  Tribe
//
//  Created by Madison Maxey on 10/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController {
    UIButton *dismissViewButton;
}

@property (nonatomic, retain) IBOutlet UIButton *dismissViewButton;

- (IBAction)dismissView:(id)sender;


@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *videoFilePath;
@property (nonatomic, strong) NSArray *friends;
//@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSMutableArray *recipients;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;

- (void)uploadMessage;
- (UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

@end
