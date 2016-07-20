//  PSImageButton.m

#import "PSImageButton.h"

@interface PSImageButton()

@property (strong, nonatomic) UIImageView *topImageView;
@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UIImageView *bottomImageView;
@property (strong, nonatomic) UIImageView *rightImageView;

@end

@implementation PSImageButton

-(void)commonInit
{
    CGFloat imageWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    CGSize imageSize = self.imageView.bounds.size;
    CGSize labelSize = self.titleLabel.bounds.size;

    switch (self.imageAlignment)
    {
        case ImageAlignmentTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(labelSize.height + self.imagePadding/2, -imageWidth, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + self.imagePadding/2), (self.bounds.size.width - imageSize.width)/2, 0, imageSize.width);
            break;
        }
        case ImageAlignmentLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, self.imagePadding/2, 0, -self.imagePadding/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -self.imagePadding/2, 0,  self.imagePadding/2);
            break;
        }
        case ImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(labelSize.height + self.imagePadding/2), -imageWidth, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(imageSize.height + self.imagePadding/2, (self.bounds.size.width - imageSize.width)/2, 0, imageSize.width);
            break;
        }
        case ImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + self.imagePadding/2), 0, imageWidth + self.imagePadding/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + self.imagePadding/2, 0, -(labelWidth + self.imagePadding/2));
            break;
        }
            
        default:
            break;
    }
}

-(void)didMoveToSuperview
{
    [self commonInit];
}

//-(void)awakeFromNib
//{
//    [self commonInit];
//}

-(void)prepareForInterfaceBuilder
{
    [self commonInit];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    PSImageButton *button = [super buttonWithType:buttonType]; // Note: This actually calls initWithFrame: in this class, while setting the buttonType behind the scenes
    return button;
}

-(void)setImageAlignment:(int)imageAlignment
{
    _imageAlignment = imageAlignment;
    [self commonInit];
}

-(void)setImagePadding:(CGFloat)imagePadding
{
    _imagePadding = imagePadding;
    [self commonInit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state {
    UIImage *buttonImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    [super setImage:buttonImage forState:state];
}

@end
