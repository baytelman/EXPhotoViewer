//
//  EXPhotoViewer.h
//  EXPhotoViewerDemo
//
//  Created by Julio Carrettoni on 3/20/14.
//  Copyright (c) 2014 Julio Carrettoni. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EXPhotoViewerWillDisplayCallback)(UIImageView*);
typedef void (^EXPhotoViewerFinishedDisplayCallback)();

@interface EXPhotoViewer : UIViewController <UIScrollViewDelegate>

+ (void) showImageFrom:(UIImageView*) imageView;
+ (void) showImageFrom:(UIImageView*) imageView
               display:(EXPhotoViewerWillDisplayCallback)displayCallback
                finish:(EXPhotoViewerFinishedDisplayCallback)finishCallback;

@end
