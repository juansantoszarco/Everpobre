//
//  JSZEverpobreBaseClass.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 03/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZEverpobreBaseClass.h"

@implementation JSZEverpobreBaseClass





#pragma mark - Lifecycle
//implementar metodos awakefromfetch, y cosas asi, para darse de alta y baja

-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    //se llama una vez en la vida
    [self setupKVO];
    
}


-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    //Se llama un monton de veces
    [self setupKVO];
    
}


-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    //Desmontamos las notificaciones a las que estamos escuchando
    [self tearDownKVO];
    
}

#pragma  mark -  Utils

-(NSArray*) observableKeys{
    return nil;
    
}

#pragma mark - KVO

//Darse de alta
-(void) setupKVO{
    //Alta en notificaciones para las propiedades que quiero observar
    
    
    //Los valores antiguo y nuevo no nos hacen falta por lo tanto se quitan
    //NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
    for (NSString* key in [self observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key
                  options:0
                  context:NULL];
        
    }
    
}

//Darse de baja
-(void) tearDownKVO{
    for (NSString* key in [self observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
        
    }
    
}



@end
