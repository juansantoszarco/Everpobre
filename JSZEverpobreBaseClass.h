//
//  JSZEverpobreBaseClass.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 03/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

@import CoreData;

@interface JSZEverpobreBaseClass : NSManagedObject

//Metodos que van a ser heredados

-(NSArray*) observableKeys;

-(void) setupKVO;

-(void) tearDownKVO;


@end
