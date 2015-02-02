//
//  JSZPhotoContainer.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 02/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JSZNote;

@interface JSZPhotoContainer : NSManagedObject

@property (nonatomic, retain) NSData * photoData;
@property (nonatomic, retain) NSSet *notes;
@end

@interface JSZPhotoContainer (CoreDataGeneratedAccessors)

- (void)addNotesObject:(JSZNote *)value;
- (void)removeNotesObject:(JSZNote *)value;
- (void)addNotes:(NSSet *)values;
- (void)removeNotes:(NSSet *)values;

@end
