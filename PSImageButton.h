//  PSImageButton.h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImageAlignment) {
    ImageAlignmentTop,
    ImageAlignmentLeft,
    ImageAlignmentRight,
    ImageAlignmentBottom
};

IB_DESIGNABLE
@interface PSImageButton : UIButton

@property (assign, nonatomic) IBInspectable int imageAlignment;
//@property (strong, nonatomic) IBInspectable UIImage *imageView;
@property (assign, nonatomic) IBInspectable CGFloat imagePadding;

@end
