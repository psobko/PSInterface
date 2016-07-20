//  UIView+Borders.m

#import "UIView+Borders.h"
#import "UIView+FrameUtils.h"

@implementation UIView (Borders)


-(void)addBorderWithColor:(UIColor*)color width:(CGFloat)borderWidth toPositions:(UIViewBorderPosition)positions
{
    int i = 1;
    int options = positions;
    while(options)
    {
        switch(options & i)
        {
            case UIViewBorderPositionTop:
                [self addBorderWithFrame:CGRectMake(0, 0, self.width, borderWidth) color:color];
                break;
                
            case UIViewBorderPositionLeft:
                [self addBorderWithFrame:CGRectMake(0, 0, borderWidth, self.height) color:color];
                break;
                
            case UIViewBorderPositionRight:
                [self addBorderWithFrame:CGRectMake(self.width - borderWidth, 0, borderWidth, self.height) color:color];
                break;
                
            case UIViewBorderPositionBottom:
                [self addBorderWithFrame:CGRectMake(0, self.height - borderWidth, self.width, borderWidth) color:color];
                
                break;
                
            default:
                break;
        }
        options &= ~i;
        i <<= 1;
    }
//    self.clipsToBounds = YES;
//    self.layer.masksToBounds = YES;
}

-(void)addBorderWithFrame:(CGRect)frame color:(UIColor*)color
{
    CALayer *border = [CALayer layer];
    border.frame = frame;
    [border setBackgroundColor:color.CGColor];
    [self.layer addSublayer:border];
}


@end
