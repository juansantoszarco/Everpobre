//
//  JSZTextTableViewCell.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZTextTableViewCell.h"
#import "JSZNote.h"

@implementation JSZTextTableViewCell

#pragma mark - Properties

-(void) setNote:(JSZNote *)note{
    //guardamos la nota
    _note = note;
    //mostramos el texto en la vista
    self.textView.text = note.text;
}

#pragma mark - Misc

-(void) prepareForReuse{
    [super prepareForReuse];
    //guardo lo que haya escrito el usuario en la nota
    self.note.text = self.textView.text;
    
    
}

#pragma mark - Class Methods

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
