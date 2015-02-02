//
//  JSZNote.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 02/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JSZNotebook, JSZPhotoContainer;

@interface JSZNote : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSDate * modificationDate;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) JSZNotebook *notebook;
@property (nonatomic, retain) JSZPhotoContainer *photo;

+(instancetype) noteWithName:(NSString* ) name context:(NSManagedObjectContext*) context;

@end
