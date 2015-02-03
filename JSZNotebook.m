#import "JSZNotebook.h"

@interface JSZNotebook ()

// Private interface goes here.

@end

@implementation JSZNotebook







+(instancetype) notebookWithName: (NSString *) name
                         context:(NSManagedObjectContext* )context{
    
    JSZNotebook *notebk = [self insertInManagedObjectContext:context];
    
    notebk.name = name;
    notebk.creationDate = [NSDate date];
    notebk.modificationDate = [NSDate date];
    
    return notebk;
    
}



#pragma mark - Lifecycle
//implementar metodos awakefromfetch, y cosas asi, para darse de alta y baja


#pragma  mark -  Utils

-(NSArray*) observableKeys{
    return @[JSZNotebookAttributes.name,JSZNotebookRelationships.notes];
    
}



#pragma  mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    //habria que hacer un if por cada keypath y asi ir variando los datos a modificar
    //Solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}



@end
