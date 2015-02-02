// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JSZPhotoContainer.m instead.

#import "_JSZPhotoContainer.h"

const struct JSZPhotoContainerAttributes JSZPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct JSZPhotoContainerRelationships JSZPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation JSZPhotoContainerID
@end

@implementation _JSZPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (JSZPhotoContainerID*)objectID {
	return (JSZPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

