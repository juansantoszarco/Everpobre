// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JSZPhotoContainer.h instead.

@import CoreData;
#import "JSZEverpobreBaseClass.h"

extern const struct JSZPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} JSZPhotoContainerAttributes;

extern const struct JSZPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} JSZPhotoContainerRelationships;

@class JSZNote;

@interface JSZPhotoContainerID : NSManagedObjectID {}
@end

@interface _JSZPhotoContainer : JSZEverpobreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JSZPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _JSZPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(JSZNote*)value_;
- (void)removeNotesObject:(JSZNote*)value_;

@end

@interface _JSZPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
