//  UIView+Borders.h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewBorderPosition)
{
//    UIViewBorderPositionNone    = 1  << 0,
    UIViewBorderPositionTop     = 1  << 1,
    UIViewBorderPositionLeft    = 1  << 2,
    UIViewBorderPositionRight   = 1  << 3,
    UIViewBorderPositionBottom  = 1  << 4,
};

@interface UIView (Borders)


-(void)addBorderWithColor:(UIColor*)color width:(CGFloat)borderWidth toPositions:(UIViewBorderPosition)positions;


@end
