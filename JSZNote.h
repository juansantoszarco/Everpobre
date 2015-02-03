#import "_JSZNote.h"

@interface JSZNote : _JSZNote {}
// Custom logic goes here.



+(instancetype) noteWithName: (NSString *) name
                    notebook:(JSZNotebook*) notebook
                     context:(NSManagedObjectContext* )context;


@end
