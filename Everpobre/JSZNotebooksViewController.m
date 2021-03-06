//
//  JSZNotebooksViewController.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 04/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNotebooksViewController.h"

#import "JSZNotebook.h"

#import "JSZNotesViewController.h"

#import "JSZNote.h"

#import "JSZNotebookTableViewCell.h"


@interface JSZNotebooksViewController ()

@end

@implementation JSZNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"EverPobre";
    
    //Añadimos botones de añadir nueva libreta, ponemos button system porque queremos un standart
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                           target:self action:@selector(addNotebook:)];
    //meto a la barra superior, ya que tiene una propiedad para ello
    self.navigationItem.rightBarButtonItem = addBtn;
    
    //Registramos el nib de la celda
    
    UINib *nib = [UINib nibWithNibName:@"JSZNotebookTableViewCell"
                                bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[JSZNotebookTableViewCell cellId]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguamos de que libreta me habla
    JSZNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    
    //creo una celda
   // static NSString *cellId = @"NotebookId";celda normal
    //creo celda para celda personalizada
    
    
    JSZNotebookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSZNotebookTableViewCell cellId] forIndexPath:indexPath];
    
    
    //la configuro (sincronizo modelo -> vista)
    cell.nameView.text = nb.name;
    cell.notesView.text = [NSString stringWithFormat:@"%lu",(unsigned long)nb.notes.count];
    
    
    
    //la devuelvo
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [JSZNotebookTableViewCell height];
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar si el pollo quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //borramos el objeto al comprobar que esta borrando
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        JSZNotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
        
    }
    
    
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return @"Eliminar";
    }
    return @"Remove";
}

#pragma  mark - Delegate


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar cual fue la libreta
    JSZNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //Creo la seleccion de datos de la bd
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[JSZNote entityName]];
    
    r.fetchBatchSize = 30;
    
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:JSZNoteAttributes.modificationDate ascending:YES]];
    
    //Busqueda con predicado
    
    r.predicate = [NSPredicate predicateWithFormat:@"notebook==%@",nb];
    
    //me creo los resultados de la consulta

    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r
                                                                        managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    
    
    //creo una instancia de controlador de notas con el resultado de la consulta
    
    JSZNotesViewController *notesVC =  [[JSZNotesViewController alloc]initWithFetchedResultsController:fc
                                                                                                 style:UITableViewStylePlain];
    
    
    //le asigno su libreta, para que lo sepa en el didload de las notas
    
    notesVC.notebook = nb;
    
    //lo pusheo
    
    [self.navigationController pushViewController:notesVC
                                         animated:YES];
    
    
}


#pragma  mark - Actions

-(void) addNotebook:(id) sender{
    
    //creamos un a nueva libreta, todo objeto de coreData se conoce el contexto, self.fetchedResultsController.managedObjectContext
    //tiene fectched result controller porque hereda de la superclase CoreDatatableviewcontroller
    
    [JSZNotebook notebookWithName:@"Nueva libreta" context:self.fetchedResultsController.managedObjectContext];
    
}





@end
