#import "JSZPhotoContainer.h"

@interface JSZPhotoContainer ()

// Private interface goes here.

@end

@implementation JSZPhotoContainer

// Custom logic goes here.


#pragma mark - Utils

-(UIImage*) image{
    //Se cambia de nsdata a uimage
    return [UIImage imageWithData:self.photoData];
    
}

-(void) setImage:(UIImage *)image{
    //Convertimos a jpeg la imagen y la pasamos al nsdata
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

@end
