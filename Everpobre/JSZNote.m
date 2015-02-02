//
//  JSZNote.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 02/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNote.h"
#import "JSZNotebook.h"
#import "JSZPhotoContainer.h"


@implementation JSZNote


//se pone dynamic porque en tiempo de ejecucion core data, captura el mensaje y crea el getter y setter en tiempo de ejecucion.

@dynamic name;
@dynamic creationDate;
@dynamic modificationDate;
@dynamic text;
@dynamic notebook;
@dynamic photo;

//Si lo hacemos de esta forma cada vez que cambiemos algo del modelo de core data nos va a borrar todos los metodos y tendremos que volver a hacerlo todo otra vez. Para ello utilizaremos mogenerator para que de forma magicamente nos lo haga, sin tener los problemas de que al cambiar el modelo se nos jodan los metodos creados.

+(instancetype) noteWithName:(NSString* ) name context:(NSManagedObjectContext*) context{
    JSZNote  *note = [NSEntityDescription insertNewObjectForEntityForName:@"Note"
                                                   inManagedObjectContext:context];
    
    note.name = name;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    
    note.photo = [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer"
                                               inManagedObjectContext:context];
    
    return note;
}

@end
