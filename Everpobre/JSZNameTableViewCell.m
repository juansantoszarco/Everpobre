//
//  JSZNameTableViewCell.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNameTableViewCell.h"
#import "JSZNote.h"

@interface JSZNameTableViewCell()


@end

@implementation JSZNameTableViewCell


#pragma mark - Properties

-(void)setNote:(JSZNote*)note{
    //sincronizamos la vista con la nota, saco del modelo y meto en la vista
    self.nameField.text = note.name;
    //guardamos la nota
    _note = note;
}

+(CGFloat)height{
    
    return 44.0f;
}

+(NSString*)cellId{
    
    return [self description];
    
}


#pragma mark - Misc



-(void) prepareForReuse{
    [super prepareForReuse];
    
    //cuando desaparezco me mandan este mensaje, para que me resetee y me prepare para ser reutilizado
    //Algo asi como viewWillDisappear para las celdas
    
    //Sincronizo la vista con la nota por si hubo cambios
    //saco de la vista y lo meto en el modelo
    self.note.name = self.nameField.text;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
