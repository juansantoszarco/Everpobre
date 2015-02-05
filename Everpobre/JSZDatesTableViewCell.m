//
//  JSZDatesTableViewCell.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZDatesTableViewCell.h"

@implementation JSZDatesTableViewCell

#pragma mark - Properties

-(void) setNote:(JSZNote *)note{
    //guardar la nota
    _note= note;
    
    //observamos modificationDate y cuando cambia la mostramos en la vista
    [self.note addObserver:self
                forKeyPath:JSZNoteAttributes.modificationDate
                   options:0
                   context:NULL];
    
    //sincronizamos el nuevo valor de modificationdate
    [self syncNoteWithView];
}

#pragma mark - KVO
-(void)prepareForReuse{
    
    [super prepareForReuse];
    
    //Hay que darse de baja en las notificaciones
    [self.note removeObserver:self forKeyPath:JSZNoteAttributes.modificationDate];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //sinronizamos el nuevo valor de modificationDate
    [self syncNoteWithView];
    
}

-(void)syncNoteWithView{
    NSDateFormatter *fmt = [NSDateFormatter new];
    
    fmt.dateStyle= NSDateFormatterShortStyle;
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle=NSDateIntervalFormatterFullStyle;
    self.modificationDate.text=[fmt stringFromDate:self.note.modificationDate];
}

#pragma mark - Methods

+(CGFloat)height{
    return 44.0f;
    
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
