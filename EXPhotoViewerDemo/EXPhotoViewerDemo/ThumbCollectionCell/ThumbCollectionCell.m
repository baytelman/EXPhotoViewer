//
//  ThumbCollectionCell.m
//  EXPhotoViewerDemo
//
//  Created by Julio Carrettoni on 3/20/14.
//  Copyright (c) 2014 Julio Carrettoni. All rights reserved.
//

#import "ThumbCollectionCell.h"
#import "EXPhotoViewer.h"

#define REMOTE_URL @"http://wallpaper-download.net/wallpapers/girls-wallpapers-beautiful-women-face-wallpaper-36304.jpg"

@implementation ThumbCollectionCell

- (IBAction)onButtonTUI:(id)sender {
    static int eachOther = 0;
    BOOL simpleShow = (++eachOther % 2) == 1;
    
    if (simpleShow) {
        [EXPhotoViewer showImageFrom:self.thumbnailImage];
    } else {
        [EXPhotoViewer showImageFrom:self.thumbnailImage
                             display:^(UIImageView * imgView) {
                                 NSLog(@"Entered fullscreen");
                                 [self loadHDImageInto:imgView];
                             } finish:^{
                                 NSLog(@"Finished displaying fullscreen");
                             }];
    }
}

- (void)loadHDImageInto:(UIImageView*)targetImageView
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL * url = [NSURL URLWithString:REMOTE_URL];
        @try {
            UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            dispatch_async(dispatch_get_main_queue(), ^{
                targetImageView.image = img;
            });
        }
        @catch (NSException *exception) {
        }
    });
}

@end
