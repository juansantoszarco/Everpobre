// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JSZNote.h instead.

@import CoreData;
#import "JSZEverpobreBaseClass.h"

extern const struct JSZNoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} JSZNoteAttributes;

extern const struct JSZNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} JSZNoteRelationships;

@class JSZNotebook;
@class JSZPhotoContainer;

@interface JSZNoteID : NSManagedObjectID {}
@end

@interface _JSZNote : JSZEverpobreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JSZNoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JSZNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) JSZPhotoContainer *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _JSZNote (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (JSZNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(JSZNotebook*)value;

- (JSZPhotoContainer*)primitivePhoto;
- (void)setPrimitivePhoto:(JSZPhotoContainer*)value;

@end
