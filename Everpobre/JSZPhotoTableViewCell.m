//
//  JSZPhotoTableViewCell.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZPhotoTableViewCell.h"

#import "JSZNote.h"

#import "JSZPhotoContainer.h"

@implementation JSZPhotoTableViewCell


#pragma mark - Properties

-(void) setNote:(JSZNote *)note{
    //guardamos la nota
    _note = note;
    
    //sincronizamos los datos de la nota con la vista
    if (note.photo.image) {
        self.photoView.image = note.photo.image;
    }
    
}


#pragma mark - Class methods

+(CGFloat)height{
    return 320.0f;
    
}

+(NSString*)cellId{
    
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
