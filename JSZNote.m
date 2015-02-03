#import "JSZNote.h"
#import "JSZPhotoContainer.h"
#import "JSZNotebook.h"

@interface JSZNote ()

// Private interface goes here.

@end

@implementation JSZNote

// Custom logic goes here.




+(instancetype) noteWithName: (NSString *) name
                    notebook:(JSZNotebook*) notebook
                     context:(NSManagedObjectContext* )context{
    
    JSZNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.creationDate = [NSDate date];
    //No tengo que ir a note e insertar la propiedad porque tiene inversa
    note.photo = [JSZPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    note.notebook = notebook;
    
    return note;
}




#pragma mark - Lifecycle
//implementar metodos awakefromfetch, y cosas asi, para darse de alta y baja



#pragma  mark -  Utils

-(NSArray*) observableKeys{
    return @[JSZNoteAttributes.name,JSZNoteAttributes.text,JSZNoteRelationships.notebook,JSZNoteRelationships.photo,@"photo.photoData"];
    
}

#pragma mark - KVO



-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    //habria que hacer un if por cada keypath y asi ir variando los datos a modificar
    //Solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}



@end
