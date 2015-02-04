//
//  AppDelegate.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 02/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"

#import "JSZNotebook.h"
#import "JSZNote.h"
#import "JSZPhotoContainer.h"

#import "JSZNotebooksViewController.h"

//importamos la categoria para que todo uinavigation entienda el wrappedIn

#import "UIViewController+Navigation.h"


@interface AppDelegate ()

@property (nonatomic,strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //creamos el stack con nombre model porque el modelo se llama Model.xcdatamodeld
    
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    
    //creamos los datos chorra
    [self createDummyData];
    
   // [self trastearConDatos];
    
    //Creamos el conjunto de datos
    
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[JSZNotebook entityName]];
    
    r.fetchBatchSize=30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.name
                                                         ascending:YES
                                                          selector:@selector(caseInsensitiveCompare:)],
                           [NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.modificationDate ascending:YES]];
    
                          
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r
                                                                        managedObjectContext:self.stack.context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    //creamos el contolador
    JSZNotebooksViewController *nbVC = [[JSZNotebooksViewController alloc]initWithFetchedResultsController:fc
                                                                                                     style:UITableViewStylePlain];
    
    //Lo metemos en un navigation
    //UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:nbVC];
    
    
    //Lo mostramos
    
  //Antiguo, usamos categorias  self.window.rootViewController = navVC;
    self.window.rootViewController = [nbVC jszWrappedInNavigation];
   
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma  mark - Utils


-(void) createDummyData{
    //borramos el contenido anterior de la libreta
    [self.stack zapAllData];
    
    //libreta
    JSZNotebook *nb = [JSZNotebook notebookWithName:@"Ex-novias para el recuerdo"
                                            context:self.stack.context];
    
    //notas a la libreta
    [JSZNote noteWithName:@"Carmen de Mairena"
                 notebook:nb
                  context:self.stack.context];
    
    [JSZNote noteWithName:@"Rosi de Palma"
                 notebook:nb
                  context:self.stack.context];
    
    [JSZNote noteWithName:@"La Venenooor"
                 notebook:nb
                  context:self.stack.context];
    
    //Fisgoneamos el contenido de la libreta
 //   NSLog(@"Libreta: %@", nb);
 //   NSLog(@"Exs: %@",nb.notes);
    
}

-(void) trastearConDatos{
    
    JSZNotebook *apps = [JSZNotebook notebookWithName:@"Ideas de Apps"
                                              context:self.stack.context];
    
    JSZNote *iCachete = [JSZNote noteWithName:@"iCachete"
                                     notebook:apps
                                      context:self.stack.context];
    
    //Comprobamos que se modifica la fecha de modificacion
    NSLog(@"Antes : %@",iCachete.modificationDate);
    
    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    
    NSLog(@"Después : %@",iCachete.modificationDate);
    
    //Realizmos una busqueda
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[JSZNote entityName]];
    
    //pedir resultados de 20 en 20
    r.fetchBatchSize = 20;
    
    //ordenar los resultados con 2 descriptores, primero por nombre diferenciando con mayusculas y minusculas(se usa selector) y luego si hay empate por fecha de modificacion
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.modificationDate ascending:NO]];
    
    //se realiza la busqueda
    NSError * err = nil;
    
    NSArray *res = [self.stack.context executeFetchRequest:r error:&err];
    
    if(res == nil){
        //la cagamos
        NSLog(@"Error al buscar: %@", err);
    }
    
    NSLog(@"Numero de notas: %lu",(unsigned long)[res count]);
    
    NSLog(@"Las notas: %@",res);
    
    //El resultado de la consulta es un Array?? es un __NSArrayI porque son clases privadas las que empiezan por 2 guiones bajos
    NSLog(@"Clase : %@", [res class]);
    
    
    /////////////////////////////////////
    ///Busqueda con predicado
    //////
    
    r.predicate = [NSPredicate predicateWithFormat:@"notebook==%@",apps];
    
    
    res = [self.stack.context executeFetchRequest:r error:&err];
    
    if(res == nil){
        //la cagamos
        NSLog(@"Error al buscar: %@", err);
    }
    
    NSLog(@"Numero de notas: %lu",(unsigned long)[res count]);
    
    NSLog(@"Las notas: %@",res);
    
    //El resultado de la consulta es un Array?? es un __NSArrayI porque son clases privadas las que empiezan por 2 guiones bajos
    NSLog(@"Clase : %@", [res class]);
    
    
    //Borrar
    //borro la libreta.si ahora busca me dara vacio, no hace falta guardar para ver los cambios, los hace en el aire
    [self.stack.context deleteObject:apps];
    
    //Guardar
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar, joder. %@",error);
    }];
    
   
    
    
}

@end
